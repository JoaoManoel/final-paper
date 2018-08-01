data "template_file" "this_socks_rabbitmq-broker-master-data" {
  count    = 1
  template = "${file("templates/rabbitmq-broker.tpl")}"

  vars {
    access_key           = "${var.access_key}"
    secret_key           = "${var.secret_key}"
    aws_region           = "${var.region}"
    bucket_name          = "${aws_s3_bucket.this_socks_s3_bucket.id}"
    datacenter           = "${aws_vpc.this_socks_vpc.tags.Name}"
    encrypt              = "${var.encrypt}"
    private_ip1          = "${element(split("/", replace(aws_subnet.this_socks_ngw_subnets.0.cidr_block, "0/", "101/")), 0)}"
    rabbitmq_type        = "master"
    rabbitmq_master_ip   = ""
    rabbitmq_master_host = ""
  }
}

data "template_file" "this_socks_rabbitmq-broker-replica-data" {
  count    = "${var.rabbitmq_servers_count - 1}"
  template = "${file("templates/rabbitmq-broker.tpl")}"

  vars {
    access_key           = "${var.access_key}"
    secret_key           = "${var.secret_key}"
    aws_region           = "${var.region}"
    bucket_name          = "${aws_s3_bucket.this_socks_s3_bucket.id}"
    datacenter           = "${aws_vpc.this_socks_vpc.tags.Name}"
    encrypt              = "${var.encrypt}"
    private_ip1          = "${element(split("/", replace(aws_subnet.this_socks_ngw_subnets.0.cidr_block, "0/", "101/")), 0)}"
    rabbitmq_type        = "replica"
    rabbitmq_master_ip   = "${aws_instance.this_socks_rabbitmq-broker-master.0.private_ip}"
    rabbitmq_master_host = "ip-${replace(aws_instance.this_socks_rabbitmq-broker-master.0.private_ip, ".", "-")}"
  }
}

resource "aws_instance" "this_socks_rabbitmq-broker-master" {
  count                       = 1
  ami                         = "${var.ami}"
  instance_type               = "t2.xlarge"
  subnet_id                   = "${aws_subnet.this_socks_ngw_subnets.1.id}"
  associate_public_ip_address = false
  key_name                    = "${aws_key_pair.this_socks_key_pair.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.this_socks_sg.id}", "${aws_security_group.this_socks_consul_sg.id}", "${aws_security_group.rabbitmq-broker_sg.id}"]
  user_data                   = "${element(data.template_file.this_socks_rabbitmq-broker-master-data.*.rendered, count.index)}"
  depends_on                  = ["aws_s3_bucket_object.this_socks_consul_agent-configurations_s3_bucket_files", "aws_instance.this_socks_consul_servers"]

  tags {
    Name = "this_socks_rabbitmq-master"
  }
}

resource "aws_instance" "this_socks_rabbitmq-broker-replicas" {
  count                       = "${var.rabbitmq_servers_count - 1}"
  ami                         = "${var.ami}"
  instance_type               = "t2.xlarge"
  subnet_id                   = "${aws_subnet.this_socks_ngw_subnets.1.id}"
  associate_public_ip_address = false
  key_name                    = "${aws_key_pair.this_socks_key_pair.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.this_socks_sg.id}", "${aws_security_group.this_socks_consul_sg.id}", "${aws_security_group.rabbitmq-broker_sg.id}"]
  user_data                   = "${element(data.template_file.this_socks_rabbitmq-broker-replica-data.*.rendered, count.index)}"
  depends_on                  = ["aws_s3_bucket_object.this_socks_consul_agent-configurations_s3_bucket_files", "aws_instance.this_socks_consul_servers", "aws_instance.this_socks_rabbitmq-broker-master"]

  tags {
    Name = "this_socks_rabbitmq-replica-${count.index + 1}"
  }
}
