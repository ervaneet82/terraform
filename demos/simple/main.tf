provider "aws" {}

resource "aws_instance" "terraform_demo" {
  count                       = "1"
  ami                         = "ami-0de53d8956e8dcf80"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  vpc_security_group_ids      = ["sg-3c33a378"]
  key_name                    = "my_aws"
}
