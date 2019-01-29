#Internet VPC

resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr_block}"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    name = "main"
  }
}

# Subnets

resource "aws_subnet" "main-public-1" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.public_subnet1_cidr}"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.public_subnet1_availability_zone}"

  tags {
    name = "main-public-1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.public_subnet2_cidr}"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.public_subnet2_availability_zone}"

  tags {
    name = "main-public-2"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "main-gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    name = "main"
  }
}

# route tables

resource "aws_route_table" "main-public" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main-gw.id}"
  }

  tags {
    name = "main-public-route-table"
  }
}

# route association public

resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = "${aws_subnet.main-public-1.id}"
  route_table_id = "${aws_route_table.main-public.id}"
}

resource "aws_route_table_association" "main-public-2-a" {
  subnet_id      = "${aws_subnet.main-public-2.id}"
  route_table_id = "${aws_route_table.main-public.id}"
}

#### Private subnets

resource "aws_subnet" "main-private-1" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.private_subnet_1_cidr}"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.private_subnet_1_availability_zone}"

  tags {
    name = "main-private-1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.private_subnet_2_cidr}"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.private_subnet_2_availability_zone}"

  tags {
    name = "main-private-1"
  }
}
