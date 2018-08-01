data "template_file" "consul-client-data" {
  count    = "${length(var.single-microservices)}"
  template = "${file("templates/user-data-client.tpl")}"

  vars {
    access_key           = "${var.access_key}"
    secret_key           = "${var.secret_key}"
    aws_region           = "${var.region}"
    bucket_name          = "${aws_s3_bucket.this_socks_s3_bucket.id}"
    datacenter           = "${aws_vpc.this_socks_vpc.tags.Name}"
    hostname             = "this_socks-consul-client-${count.index + 1}"
    encrypt              = "${var.encrypt}"
    private_ip1          = "${element(split("/", replace(aws_subnet.this_socks_ngw_subnets.0.cidr_block, "0/", "101/")), 0)}"
    microservice_command = "${lookup(var.single-microservices[count.index], "command")}"
  }
}

data "template_file" "consul-asg-client-data" {
  count    = "${length(var.autoscaling-microservices)}"
  template = "${file("templates/user-data-client.tpl")}"

  vars {
    access_key           = "${var.access_key}"
    secret_key           = "${var.secret_key}"
    aws_region           = "${var.region}"
    bucket_name          = "${aws_s3_bucket.this_socks_s3_bucket.id}"
    datacenter           = "${aws_vpc.this_socks_vpc.tags.Name}"
    hostname             = "this_socks-consul-asg-server-${count.index + 1}"
    encrypt              = "${var.encrypt}"
    private_ip1          = "${element(split("/", replace(aws_subnet.this_socks_ngw_subnets.0.cidr_block, "0/", "101/")), 0)}"
    microservice_command = "${lookup(var.autoscaling-microservices[count.index], "command")}"
  }
}

# # ASG Microservices 
resource "aws_autoscaling_group" "this_socks_clients_asg" {
  count            = "${length(var.autoscaling-microservices)}"
  name             = "${lookup(var.autoscaling-microservices[count.index], "name")}-${uuid()}-asg"
  min_size         = "${lookup(var.autoscaling-microservices[count.index], "min_size")}"
  max_size         = "${lookup(var.autoscaling-microservices[count.index], "max_size")}"
  desired_capacity = "${lookup(var.autoscaling-microservices[count.index], "desired_capacity")}"
  force_delete     = true

  vpc_zone_identifier = ["${aws_subnet.this_socks_ngw_subnets.*.id}"]

  launch_configuration = "${aws_launch_configuration.clients_launch_configuration.*.name[count.index]}"

  depends_on = ["aws_instance.this_socks_consul_servers"]

  tags = [
    {
      key                 = "Name"
      value               = "service_clients_${lookup(var.autoscaling-microservices[count.index], "name")}"
      propagate_at_launch = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }
}

# Normal Microservices
resource "aws_instance" "this_socks_clients" {
  count         = "${length(var.single-microservices)}"
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  subnet_id = "${element(aws_subnet.this_socks_ngw_subnets.*.id, count.index)}"

  associate_public_ip_address = false
  key_name                    = "${aws_key_pair.this_socks_key_pair.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.this_socks_sg.id}", "${element(aws_security_group.single-microservices_sg.*.id, count.index)}"]

  user_data = "${data.template_file.consul-client-data.*.rendered[count.index]}"

  depends_on = ["aws_instance.this_socks_consul_servers"]

  tags {
    Name = "client_${lookup(var.single-microservices[count.index], "name")}"
  }
}
