provider "aws" {}

resource "aws_instance" "terraform_demo" {
  count                       = "${var.nodes}"
  ami                         = "${lookup(var.ami,var.region)}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = "true"
  vpc_security_group_ids      = ["${lookup(var.security_group,var.region)}"]
  key_name                    = "${var.key_pair}"
}
