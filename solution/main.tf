provider aws {
  version = "1.59.0"
}

data "aws_ami" "amazon" {
  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  most_recent = true
  owners      = ["self"]
}

# data "aws_subnet_ids" "vpc" {
#   vpc_id = "vpc-f9ca7283"
# }
#
# data "aws_subnet" "public_subnet" {
#   count = "${length(data.aws_subnet_ids.vpc.ids)}"
#   id    = "${data.aws_subnet_ids.vpc.ids[count.index]}"
# }
#
# # output "subnet_cidr_blocks" {
# #   value = ["${data.aws_subnet.example.*.cidr_block}"]
# # }
#
# resource "aws_instance" "app" {
#   count         = "1"
#   ami           = "${data.aws_ami.amazon.id}"
#   instance_type = "t2.micro"
#   subnet_id     = "${element(data.aws_subnet.public_subnet.ids, count.index)}"
# }

