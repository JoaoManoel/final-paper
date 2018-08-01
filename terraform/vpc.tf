resource "aws_vpc" "this_socks_vpc" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name = "this_socks_vpc"
  }
}

resource "aws_eip" "this_socks_eip" {
  vpc = true

  tags {
    Name = "this_socks_eip"
  }
}

resource "aws_subnet" "this_socks_igw_subnets" {
  count                   = "${length(var.igw_zones)}"
  vpc_id                  = "${aws_vpc.this_socks_vpc.id}"
  availability_zone       = "${lookup(var.igw_zones, count.index)}"
  cidr_block              = "10.0.${count.index + 1}.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "this_socks_subnet_igw_${count.index + 1}"
  }
}

resource "aws_subnet" "this_socks_ngw_subnets" {
  count             = "${length(var.ngw_zones)}"
  vpc_id            = "${aws_vpc.this_socks_vpc.id}"
  availability_zone = "${lookup(var.ngw_zones, count.index)}"
  cidr_block        = "10.0.${count.index + 1 + length(var.igw_zones)}.0/24"

  tags {
    Name = "this_socks_subnet_ngw_${count.index + 1}"
  }
}

resource "aws_internet_gateway" "this_socks_igw" {
  vpc_id = "${aws_vpc.this_socks_vpc.id}"

  tags {
    Name = "this_socks_igw"
  }
}

resource "aws_nat_gateway" "this_socks_ngw" {
  allocation_id = "${aws_eip.this_socks_eip.id}"
  subnet_id     = "${element(aws_subnet.this_socks_igw_subnets.*.id, 0)}"
}

resource "aws_route_table" "this_socks_igw_rt" {
  vpc_id = "${aws_vpc.this_socks_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.this_socks_igw.id}"
  }

  tags {
    Name = "this_socks_igw_rt"
  }
}

resource "aws_route_table" "this_socks_ngw_rt" {
  vpc_id = "${aws_vpc.this_socks_vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.this_socks_ngw.id}"
  }

  tags {
    Name = "this_socks_ngw_rt"
  }
}

resource "aws_route_table_association" "route_table_igw_associations" {
  count          = "${length(var.igw_zones)}"
  subnet_id      = "${element(aws_subnet.this_socks_igw_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.this_socks_igw_rt.id}"
}

resource "aws_route_table_association" "route_table_ngw_association" {
  count          = "${length(var.ngw_zones)}"
  subnet_id      = "${element(aws_subnet.this_socks_ngw_subnets.*.id, count.index)}"
  route_table_id = "${aws_route_table.this_socks_ngw_rt.id}"
}
