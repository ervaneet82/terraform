provider "aws" {}

resource "aws_instance" "terraform_demo" {
  count                       = "${var.nodes}"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = "true"
  vpc_security_group_ids      = ["${var.security_group}"]
  key_name                    = "${var.key_pair}"
}
