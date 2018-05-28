provider "aws" {
  #shared_credentials_file = "$HOME/.aws/credentials"
  profile = "vaneet"
  region  = "${var.region}"
}

resource "aws_instance" "terraform_test" {
  ami                         = "${data.aws_ami.amazon.id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  depends_on                  = ["aws_s3_bucket.terraform_test"]

  tags {
    Name = "Test"
  }

  timeouts {
    create = "2m"
  }

  # }
  provisioner "local-exec" {
    command = "echo ${aws_instance.terraform_test.public_ip} > aws_ip.txt"

    #timeout = "5m"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"

    #timeout = "5m"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "bash /tmp/script.sh",
    ]
  }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }
}
