data "template_file" "api-gateway-data" {
  template = "${file("templates/api-gateway.tpl")}"

  vars {
    access_key  = "${var.access_key}"
    secret_key  = "${var.secret_key}"
    aws_region  = "${var.region}"
    bucket_name = "${aws_s3_bucket.this_socks_s3_bucket.id}"
    datacenter  = "${aws_vpc.this_socks_vpc.tags.Name}"
    encrypt     = "${var.encrypt}"
    private_ip1 = "${element(split("/", replace(aws_subnet.this_socks_ngw_subnets.0.cidr_block, "0/", "101/")), 0)}"
  }
}

resource "aws_elb" "api_gateway_elb" {
  name            = "this-socks-api-gateway"
  subnets         = ["${aws_subnet.this_socks_igw_subnets.*.id}"]
  security_groups = ["${aws_security_group.api_gateway_sg.id}"]

  listener {
    lb_port           = "80"
    lb_protocol       = "http"
    instance_port     = "3000"
    instance_protocol = "http"
  }

  health_check {
    healthy_threshold   = 5
    unhealthy_threshold = 5
    interval            = 60
    timeout             = 45
    target              = "HTTP:3000/ping"
  }
}

resource "aws_launch_configuration" "api_gateway_launch_configuration" {
  name_prefix                 = "this_socks-api_gateway"
  image_id                    = "${var.ami}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.this_socks_key_pair.key_name}"
  security_groups             = ["${aws_security_group.this_socks_sg.id}", "${aws_security_group.this_socks_consul_sg.id}", "${aws_security_group.this_socks_asg_sg.id}", "${aws_security_group.autoscaling-microservices_sg.*.id}", "${aws_security_group.api_gateway_instance_sg.id}"]
  associate_public_ip_address = true
  user_data                   = "${data.template_file.api-gateway-data.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "this_socks_api_gateway_asg" {
  name                 = "this_socks_api_gateway_asg"
  min_size             = 1
  max_size             = 3
  desired_capacity     = 1
  force_delete         = true
  vpc_zone_identifier  = ["${aws_subnet.this_socks_igw_subnets.*.id}"]
  launch_configuration = "${aws_launch_configuration.api_gateway_launch_configuration.name}"
  load_balancers       = ["${aws_elb.api_gateway_elb.name}"]
  health_check_type    = "ELB"
  depends_on           = ["aws_autoscaling_group.this_socks_clients_asg", "aws_instance.this_socks_clients", "aws_s3_bucket_object.this_socks_consul_agent-configurations_s3_bucket_files", "aws_s3_bucket_object.this_socks_machine_api_gateway_nginx_s3_bucket_files", "aws_s3_bucket_object.this_socks_machine_api_gateway_app_nodejs"]

  tags = [
    {
      key                 = "Name"
      value               = "this_socks_api_gateway"
      propagate_at_launch = true
    },
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "this_socks_api_gateway_asg_cpu_increase_policy" {
  name                      = "this_socks_api_gateway_asg_cpu_increase_policy"
  autoscaling_group_name    = "${aws_autoscaling_group.this_socks_api_gateway_asg.name}"
  policy_type               = "StepScaling"
  adjustment_type           = "ChangeInCapacity"
  metric_aggregation_type   = "Maximum"
  estimated_instance_warmup = "60"

  step_adjustment {
    scaling_adjustment          = 1
    metric_interval_lower_bound = 0
  }
}

resource "aws_autoscaling_policy" "this_socks_api_gateway_asg_cpu_shrink_policy" {
  name                      = "this_socks_api_gateway_asg_cpu_shrink_policy"
  autoscaling_group_name    = "${aws_autoscaling_group.this_socks_api_gateway_asg.name}"
  policy_type               = "StepScaling"
  adjustment_type           = "ChangeInCapacity"
  metric_aggregation_type   = "Maximum"
  estimated_instance_warmup = "60"

  step_adjustment {
    scaling_adjustment          = -1
    metric_interval_upper_bound = 0
  }
}

resource "aws_cloudwatch_metric_alarm" "this_socks_api_gateway_cpu_increase_alarm" {
  alarm_name          = "this_socks_api_gateway_cpu_increase_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "75"
  alarm_actions       = ["${aws_autoscaling_policy.this_socks_api_gateway_asg_cpu_increase_policy.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "this_socks_api_gateway_cpu_shrink_alarm" {
  alarm_name          = "this_socks_api_gateway_cpu_shrink_alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "75"
  alarm_actions       = ["${aws_autoscaling_policy.this_socks_api_gateway_asg_cpu_shrink_policy.arn}"]
}
