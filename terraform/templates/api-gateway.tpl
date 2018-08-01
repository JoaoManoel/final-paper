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
TYPE="client"
CONSUL_HTTP_ADDR="169.254.1.1:8500"
CONSUL_RPC_ADDR="169.254.1.1:8400"

install() {
	apt-get -y update

	curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

	apt-get install -y jq bc unzip python-pip uuid-runtime nodejs

	HOSTNAME=$(echo "this-socks_consul_client-$(uuidgen | cut -d"-" -f1)")

	pip install awscli

	wget https://releases.hashicorp.com/consul/1.0.6/consul_1.0.6_linux_amd64.zip

	unzip consul_*.zip
	
	mv consul /usr/bin

	cd /home/ubuntu

	mkdir app

	aws s3 sync s3://$BUCKET_NAME .

	chmod +x -R ./machine_status_scripts

	mv app_gateway.zip app

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
}

generate_json() {
    sed -i -- "s/__DATACENTER__/$DATACENTER/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__NODE_NAME__/$HOSTNAME/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__ENCRYPT__/$ENCRYPT/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__BIND_ADDR__/$PRIVATE_IP2/g" "consul_agent-configurations/$TYPE-config.json"
    sed -i -- "s/__START_JOIN__/$PRIVATE_IP1/g" "consul_agent-configurations/$TYPE-config.json"
		sed -i -- "s/__CLIENT_ADDR__/169.254.1.1/g" "consul_agent-configurations/$TYPE-config.json"

	start_consul
}

start_consul() {
	nohup consul agent -config-dir "consul_agent-configurations/$TYPE-config.json" &

	start_api_gateway_app
}

start_api_gateway_app() {
	cd /home/ubuntu/app
	unzip app_gateway.zip
	npm install
	
	MODE=prod PORT=3000 nohup node app.js &
}

install