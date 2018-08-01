resource "aws_security_group" "this_socks_sg" {
  name        = "this_socks_sg"
  description = "SSH port and Swarm Ports"
  vpc_id      = "${aws_vpc.this_socks_vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2377
    to_port     = 2377
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7946
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7946
    to_port     = 7946
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4789
    to_port     = 4789
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "this_socks_consul_sg" {
  name        = "this_socks_consul_sg"
  description = "Consul ports"
  vpc_id      = "${aws_vpc.this_socks_vpc.id}"

  ingress {
    from_port   = 8300
    to_port     = 8300
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8301
    to_port     = 8302
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8301
    to_port     = 8302
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8500
    to_port     = 8500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8600
    to_port     = 8600
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8600
    to_port     = 8600
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "this_socks_asg_sg" {
  name        = "this_socks_asg_sg"
  description = "HTTP port"
  vpc_id      = "${aws_vpc.this_socks_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "rabbitmq-broker_sg" {
  name        = "single-rabbitmq-broker-sg"
  description = "RabbitMQ Broker Ports"
  vpc_id      = "${aws_vpc.this_socks_vpc.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # ingress {
  #   from_port   = 5671
  #   to_port     = 5671
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }


  # ingress {
  #   from_port   = 5672
  #   to_port     = 5672
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }


  # ingress {
  #   from_port   = 15672
  #   to_port     = 15672
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }


  # ingress {
  #   from_port   = 25672
  #   to_port     = 25672
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }


  # ingress {
  #   from_port   = 35672
  #   to_port     = 35682
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "single-microservices_sg" {
  count       = "${length(var.single-microservices)}"
  name        = "single-microservices-${lookup(var.single-microservices[count.index], "from_port")}-${uuid()}-sg"
  description = "Microservice Port"
  vpc_id      = "${aws_vpc.this_socks_vpc.id}"

  ingress {
    from_port   = "${lookup(var.single-microservices[count.index], "from_port")}"
    to_port     = "${lookup(var.single-microservices[count.index], "to_port")}"
    protocol    = "${lookup(var.single-microservices[count.index], "protocol")}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "api_gateway_sg" {
  name        = "api_gateway_sg"
  description = "API Gateway Port"
  vpc_id      = "${aws_vpc.this_socks_vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "api_gateway_instance_sg" {
  name        = "api_gateway_instance_sg"
  description = "API Gateway Instance Port"
  vpc_id      = "${aws_vpc.this_socks_vpc.id}"

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "autoscaling-microservices_sg" {
  count       = "${length(var.autoscaling-microservices)}"
  name        = "autoscaling-microservices-${lookup(var.autoscaling-microservices[count.index], "from_port")}-${uuid()}-sg"
  description = "Microservice Port"
  vpc_id      = "${aws_vpc.this_socks_vpc.id}"

  ingress {
    from_port   = "${lookup(var.autoscaling-microservices[count.index], "from_port")}"
    to_port     = "${lookup(var.autoscaling-microservices[count.index], "to_port")}"
    protocol    = "${lookup(var.autoscaling-microservices[count.index], "protocol")}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
