provider aws {
  #version = "1.38.0"
}

data "aws_ami" "example" {
  most_recent = true
  owners      = ["amazon", "self"]

  #  name_regex  = "Amazon Linux 2 AMI (HVM), SSD Volume Type"

  filter {
    name = "name"

    values = ["amzn2-ami-hvm*"]

    #values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20190212.1"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "ami_ids" {
  value = ["${data.aws_ami.example.*.id}"]
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr_block}"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    name = "main"
  }
}

resource "aws_subnet" "main-public" {
  count             = "${var.count}"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet(var.cidr_block,8,count.index + 1)}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    name = "main-public-${count.index + 1}"
  }
}

# data "aws_subnet" "public_subnet" {
#   count = "${length(data.aws_subnet_ids.vpc.ids)}"
#   id    = "${data.aws_subnet_ids.vpc.ids[count.index]}"
# }
#
# output "subnet_cidr_blocks" {
#   value = ["${data.aws_subnet.public_subnet.*.cidr_block}"]
# }


# resource "aws_instance" "app" {
#   count         = "1"
#   ami           = "${data.aws_ami.amazon.id}"
#   instance_type = "t2.micro"
#   subnet_id     = "${element(data.aws_subnet.public_subnet.ids, count.index)}"
# }

