#!/bin/bash
# set -e
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export AWS_ACCESS_KEY_ID="${access_key}"
export AWS_SECRET_ACCESS_KEY="${secret_key}"
export AWS_DEFAULT_REGION="${aws_region}"
export RABBITMQ_USE_LONGNAME=true

BUCKET_NAME="${bucket_name}"
DATACENTER="${datacenter}"
ENCRYPT="${encrypt}"
PRIVATE_IP1="${private_ip1}"
PRIVATE_IP2=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
TYPE="client"
CONSUL_HTTP_ADDR="169.254.1.1:8500"
CONSUL_RPC_ADDR="169.254.1.1:8400"


RABBITMQ_TYPE="${rabbitmq_type}"
RABBITMQ_MASTER_IP="${rabbitmq_master_ip}"
RABBITMQ_MASTER_HOSTNAME="${rabbitmq_master_host}"

RABBITMQ_ERLANG_COOKIE="FGRZQFJSKPNLLHKHEJMM"

install() {
    apt-get -y update

	apt-get install -y jq bc unzip python-pip uuid-runtime rabbitmq-server

    HOSTNAME=$(echo "this-socks_consul_client-$(uuidgen | cut -d"-" -f1)")

    pip install awscli

    wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip

    unzip *.zip && rm -rf *.zip && mv consul /usr/bin

    cd /home/ubuntu

    aws s3 sync s3://$BUCKET_NAME .

    chmod +x -R ./machine_status_scripts

    start_dummyIP
}

start_dummyIP() {
    cat <<EOF >> /etc/systemd/network/dummy0.netdev
[NetDev]
Name=dummy0
Kind=dummy
EOF
    
    cat <<EOF >> /etc/systemd/network/dummy0.network
[Match]
Name=dummy0

[Network]
Address=169.254.1.1/32
EOF

    systemctl restart systemd-networkd

    apt-get install -y dnsmasq

    cat <<EOF >> /etc/dnsmasq.d/consul.conf
server=/consul/169.254.1.1#8600
listen-address=127.0.0.1
listen-address=169.254.1.1
EOF

    service dnsmasq restart

    echo "CONSUL_HTTP_ADDR=$CONSUL_HTTP_ADDR" >> /etc/environment
    echo "CONSUL_RPC_ADDR=$CONSUL_RPC_ADDR" >> /etc/environment

    generate_json

    start_rabbitmq
}

generate_json() {
    sed -i -- "s/__DATACENTER__/$DATACENTER/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__NODE_NAME__/$HOSTNAME/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__ENCRYPT__/$ENCRYPT/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__BIND_ADDR__/$PRIVATE_IP2/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__START_JOIN__/$PRIVATE_IP1/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__CLIENT_ADDR__/169.254.1.1/g" "consul_agent-configurations/$TYPE-config.json"

    nohup consul agent -config-dir "consul_agent-configurations/$TYPE-config.json" &
}

start_rabbitmq() {
    rabbitmqctl force_reset
    
    service rabbitmq-server stop
    sleep 3
    
    echo $RABBITMQ_ERLANG_COOKIE > /var/lib/rabbitmq/.erlang.cookie
    sleep 3
    
    /etc/init.d/rabbitmq-server restart
    sleep 3
    
    rabbitmqctl stop_app
    sleep 5

    rabbitmqctl reset
    sleep 5

    # #rabbitmq-plugins enable rabbitmq_management
    if [ "$RABBITMQ_TYPE" == "master" ]; 
    then
        rabbitmqctl start_app
        sleep 5

        echo "Setting RabbitMQ Permissions and Policy"
        rabbitmq-plugins enable rabbitmq_management
        rabbitmqctl add_user socks socks
        rabbitmqctl set_user_tags socks administrator
        rabbitmqctl set_permissions -p / socks ".*" ".*" ".*"
        rabbitmqctl set_policy ha-all "" '{"ha-mode":"exactly", "ha-params":3, "ha-sync-mode":"automatic"}'
        echo "RabbitMQ Master Up and Running!!!"
    else
        echo "$RABBITMQ_MASTER_IP $RABBITMQ_MASTER_HOSTNAME" | sudo tee -a /etc/hosts
       
        echo "RabbitMQ joining to cluster"
        RABBITMQ_CLUSTER_NODE="rabbit@$RABBITMQ_MASTER_HOSTNAME"
       
        echo "RabbitMQ Cluster Node: $RABBITMQ_CLUSTER_NODE"
        rabbitmqctl join_cluster $RABBITMQ_CLUSTER_NODE
        sleep 5

        echo "RabbitMQ Replica joined the cluster"

        rabbitmqctl start_app
        echo "RabbitMQ Replica app started!!!"
    fi

    curl \
    --request PUT \
    --header "Content-Type: application/json" \
    --data '{"Name": "this_socks_rabbitmq", "Port": 5672}' \
    $CONSUL_HTTP_ADDR/v1/agent/service/register
}

install