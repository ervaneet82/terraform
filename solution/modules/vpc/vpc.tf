# Creating VPC -----

resource "aws_vpc" "custom" {
  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "${var.tenancy}"
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    Name = "${var.vpc_tag}"
  }
}

# Find the availability_zones based on region ----

data "aws_availability_zones" "available" {}

# Creating subnet and assign cidr block by cidrsubnet ----

resource "aws_subnet" "public" {
  count      = "${var.subnet_count}"
  vpc_id     = "${aws_vpc.custom.id}"
  cidr_block = "${cidrsubnet(var.cidr_block,8,count.index + 1)}"

  #availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  availability_zone       = "${element(sort(data.aws_availability_zones.available.names), count.index)}"
  map_public_ip_on_launch = "${var.enable_ip_address_on_launch}"

  tags {
    Name = "public-${count.index + 1}"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "main-gw" {
  vpc_id = "${aws_vpc.custom.id}"

  tags {
    Name = "${aws_vpc.custom.id}-${var.igw_tag}"
  }
}

# route tables

resource "aws_route_table" "main-public" {
  vpc_id = "${aws_vpc.custom.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-gw.id}"
  }

  tags {
    Name = "${aws_vpc.custom.id}-${var.route_tag}"
  }
}

# route association public

resource "aws_route_table_association" "main-public-1-a" {
  count          = "${var.subnet_count}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.main-public.id}"
}
