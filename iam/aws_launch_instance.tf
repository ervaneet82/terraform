provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "terraform_test" {
  ami                         = "${data.aws_ami.amazon.id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["sg-d5835c9c"]
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  depends_on                  = ["aws_s3_bucket.terraform_test"]
  iam_instance_profile        = "${aws_iam_instance_profile.ec2-role.name}"

  tags {
    Name = "Test"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get -y install python-pip",
      "sudo pip install awscli",
    ]
  }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }
}
