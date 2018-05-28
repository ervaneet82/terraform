provider "aws" {
  #  access_key = "${var.access_key}"
  #  secret_key = "${var.secret_key}"
  #  region     = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"

  profile = "vaneet"
  region  = "${var.region}"
}

resource "aws_instance" "terraform_test" {
  # count                       = "${var.count}"
  ami           = "${data.aws_ami.amazon.id}"
  instance_type = "t2.micro"

  # subnet_id                   = "${var.subnet_id}"
  # availability_zone           = "us-east-1a"
  associate_public_ip_address = "true"

  # key_name                    = "${var.key_name}"
  # security_groups             = ["${data.aws_security_group.my.id}"]

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo apt-get update",
  #     "sudo apt-get install -y haproxy",
  #   ]
  #
  #   connection {
  #     user        = "ubuntu"
  #     private_key = "${file("${var.key}")}"
  #     timeout     = "60m"
  #   }
  # }
  tags {
    Name = "Test"
  }
}
