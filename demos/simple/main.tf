provider "aws" {}

resource "aws_instance" "terraform_demo" {
  count                       = "1"
  ami                         = "ami-009d6802948d06e52"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  vpc_security_group_ids      = ["sg-0710ca1f42c4a2e65"]
  key_name                    = "my_aws"
}
