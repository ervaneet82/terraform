provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "public_instance" {
  ami                         = "${data.aws_ami.amazon.id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.app_server.id}"]
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  subnet_id                   = "${aws_subnet.main-public-1.id}"

  tags {
    Name = "Public"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install apache2 -y",
      "sudo systemctl restart apache2.service",
    ]
  }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }
}

resource "aws_instance" "private_instance" {
  ami                    = "${data.aws_ami.amazon.id}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.app_server.id}"]
  key_name               = "${aws_key_pair.mykey.key_name}"
  subnet_id              = "${aws_subnet.main-private-1.id}"

  tags {
    Name = "Private"
  }
}
