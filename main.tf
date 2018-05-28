provider "aws" {
  access_key = "AKIAJVWJ5QRPXEOS5GFQ"
  secret_key = "+dLXwIq4krydo6C3QMjhLMA/jhojmbx4HrUGhzxO"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-1853ac65"
  instance_type = "t2.micro"
}
