data "template_file" "swarm-master-data" {
  count    = "${var.server_count}"
  template = "${file("templates/user-data-server.tpl")}"

  vars {
    access_key  = "${var.access_key}"
    secret_key  = "${var.secret_key}"
    aws_region  = "${var.region}"
    bucket_name = "${aws_s3_bucket.this_socks_s3_bucket.id}"
    datacenter  = "${aws_vpc.this_socks_vpc.tags.Name}"
    hostname    = "this_socks-consul-server-${count.index + 1}"
    encrypt     = "${var.encrypt}"
    private_ip1 = "${element(split("/", replace(aws_subnet.this_socks_ngw_subnets.0.cidr_block, "0/", "101/")), 0)}"
  }
}

resource "aws_instance" "this_socks_swarm_master" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${aws_subnet.this_socks_ngw_subnets.0.id}"
  associate_public_ip_address = false
  private_ip                  = "${element(split("/", replace(aws_subnet.this_socks_ngw_subnets.0.cidr_block, "0/", "101/")), 0)}"
  key_name                    = "${aws_key_pair.this_socks_key_pair.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.this_socks_sg.id}", "${aws_security_group.this_socks_consul_sg.id}"]
  user_data                   = "${data.template_file.swarm-master-data.0.rendered}"
  depends_on                  = ["aws_s3_bucket_object.this_socks_consul_agent-configurations_s3_bucket_files", "aws_s3_bucket_object.this_socks_machine_status_scripts_s3_bucket_files"]

  tags = {
    Name = "this_socks_swarm_master"
  }
}
