#!/bin/bash
set -e
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export AWS_ACCESS_KEY_ID="${access_key}"
export AWS_SECRET_ACCESS_KEY="${secret_key}"
export AWS_DEFAULT_REGION="${aws_region}"

BUCKET_NAME="${bucket_name}"
DATACENTER="${datacenter}"
ENCRYPT="${encrypt}"
PRIVATE_IP1="${private_ip1}"
PRIVATE_IP2=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

if [ $PRIVATE_IP1 == $PRIVATE_IP2 ];
then
    TYPE="bootstrap"
else
    TYPE="server"
fi

install() {
    apt-get -y update

    apt-get install -y bc unzip python-pip uuid-runtime docker.io

    HOSTNAME=$(echo "this-socks_consul_server-$(uuidgen | cut -d"-" -f1)")

    pip install awscli

    wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip

    unzip *.zip && rm -rf *.zip && mv consul /usr/bin

    cd /home/ubuntu

    aws s3 sync s3://$BUCKET_NAME .

    chmod +x -R ./machine_status_scripts

    usermod -a -G docker ubuntu

    service docker start
}

generate_json() {
    sed -i -- "s/__DATACENTER__/$DATACENTER/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__NODE_NAME__/$HOSTNAME/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__ENCRYPT__/$ENCRYPT/g" "consul_agent-configurations/$TYPE-config.json"

    if [ "$TYPE" == "bootstrap" ];
    then
        sed -i -- "s/__BIND_ADDR__/$PRIVATE_IP1/g" "consul_agent-configurations/$TYPE-config.json"
    else
        sed -i -- "s/__BIND_ADDR__/$PRIVATE_IP2/g" "consul_agent-configurations/$TYPE-config.json"
        sed -i -- "s/__START_JOIN__/$PRIVATE_IP1/g" "consul_agent-configurations/$TYPE-config.json"
    fi

    nohup consul agent -config-dir "consul_agent-configurations/$TYPE-config.json" &
}

if [ "$TYPE" == "bootstrap" -o  "$TYPE" == "server" ];
then
    install
    case $TYPE in
        bootstrap)
            generate_json "bootstrap-config"
            # Swarm Manager Master init
            docker swarm init
            sleep 10

            consul kv put DOCKER_THIS_SOCKS_SWARM_MANAGER_TOKEN $(docker swarm join-token manager --quiet)
            consul kv put DOCKER_THIS_SOCKS_SWARM_WORKER_TOKEN $(docker swarm join-token worker --quiet)
            
            docker network create --driver overlay --subnet 192.168.100.0/24 --attachable this-socks-overlay
            ;;
        server)
            generate_json "server-config"
            sleep 60
            
            # Swarm Manager join
            TOKEN=$(consul kv get DOCKER_THIS_SOCKS_SWARM_MANAGER_TOKEN)
            docker swarm join --token $TOKEN $PRIVATE_IP1:2377
            ;;
    esac
else
    echo "$TYPE is a invalid type of server agent"
fi