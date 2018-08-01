resource "aws_instance" "this_socks_bastion" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"

  subnet_id = "${element(aws_subnet.this_socks_igw_subnets.*.id, 0)}"

  associate_public_ip_address = true
  key_name                    = "${aws_key_pair.this_socks_key_pair.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.this_socks_sg.id}"]

  tags {
    Name = "this_socks_bastion"
  }

  provisioner "file" {
    source      = "public.pem"
    destination = "/home/ubuntu/public.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("public.pem")}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ubuntu/public.pem",
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = "${file("public.pem")}"
    }
  }
}
