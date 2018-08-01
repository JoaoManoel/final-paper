output "bastion_ip" {
  value = "${aws_instance.this_socks_bastion.public_ip}"
}

output "api-gateway" {
  value = "${aws_elb.api_gateway_elb.dns_name}"
}

output "this_socks_swarm_master" {
  value = "${aws_instance.this_socks_swarm_master.private_ip}"
}

output "this_socks_rabbitmq_master" {
  value = "${aws_instance.this_socks_rabbitmq-broker-master.*.private_ip}"
}

output "this_socks_rabbitmq_replicas" {
  value = "${aws_instance.this_socks_rabbitmq-broker-replicas.*.private_ip}"
}

output "consul_servers_private_ip" {
  value = "${aws_instance.this_socks_consul_servers.*.private_ip}"
}

output "normal_microservices_ip" {
  value = "${aws_instance.this_socks_clients.*.private_ip}"
}
