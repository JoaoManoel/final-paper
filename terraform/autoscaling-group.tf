resource "aws_launch_configuration" "clients_launch_configuration" {
  count                       = "${length(var.autoscaling-microservices)}"
  name_prefix                 = "this_socks-asg-clients-"
  image_id                    = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${aws_key_pair.this_socks_key_pair.key_name}"
  security_groups             = ["${aws_security_group.this_socks_sg.id}", "${aws_security_group.this_socks_consul_sg.id}", "${aws_security_group.this_socks_asg_sg.id}", "${element(aws_security_group.autoscaling-microservices_sg.*.id, count.index)}"]
  associate_public_ip_address = false
  user_data                   = "${data.template_file.consul-asg-client-data.*.rendered[count.index]}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "this_socks_clients_asg_cpu_increase_policy" {
  count = "${length(var.autoscaling-microservices)}"

  name                      = "this_socks_clients_asg_cpu_increase_policy-${uuid()}"
  autoscaling_group_name    = "${element(aws_autoscaling_group.this_socks_clients_asg.*.name, count.index)}"
  policy_type               = "StepScaling"
  adjustment_type           = "ChangeInCapacity"
  metric_aggregation_type   = "Maximum"
  estimated_instance_warmup = "60"

  step_adjustment {
    scaling_adjustment          = 1
    metric_interval_lower_bound = 0
  }
}

resource "aws_autoscaling_policy" "this_socks_clients_asg_cpu_shrink_policy" {
  count                     = "${length(var.autoscaling-microservices)}"
  name                      = "this_socks_clients_asg_cpu_shrink_policy-${uuid()}"
  autoscaling_group_name    = "${element(aws_autoscaling_group.this_socks_clients_asg.*.name, count.index)}"
  policy_type               = "StepScaling"
  adjustment_type           = "ChangeInCapacity"
  metric_aggregation_type   = "Maximum"
  estimated_instance_warmup = "60"

  step_adjustment {
    scaling_adjustment          = -1
    metric_interval_upper_bound = 0
  }
}

resource "aws_cloudwatch_metric_alarm" "this_socks_clients_cpu_increase_alarm" {
  count = "${length(var.autoscaling-microservices)}"

  alarm_name          = "this_socks_clients_cpu_increase_alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "75"
  alarm_actions       = ["${element(aws_autoscaling_policy.this_socks_clients_asg_cpu_increase_policy.*.arn, count.index)}"]
}

resource "aws_cloudwatch_metric_alarm" "this_socks_clients_cpu_shrink_alarm" {
  count = "${length(var.autoscaling-microservices)}"

  alarm_name          = "this_socks_clients_cpu_shrink_alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "75"
  alarm_actions       = ["${element(aws_autoscaling_policy.this_socks_clients_asg_cpu_shrink_policy.*.arn, count.index)}"]
}
