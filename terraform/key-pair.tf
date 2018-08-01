resource "aws_key_pair" "this_socks_key_pair" {
  key_name   = "this_socks_key_pair"
  public_key = "${var.public_key_pair}"
}
