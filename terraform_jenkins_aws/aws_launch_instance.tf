provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "terraform_test" {
  ami                         = "${data.aws_ami.amazon.id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  subnet_id                   = "${aws_subnet.main-public-1.id}"

  tags {
    Name = "Jenkins-Server"
  }

  timeouts {
    create = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt udpate",
      "sudo apt install wget",
      "wget https://packages.chef.io/files/stable/chef/14.4.56/ubuntu/16.04/chef_14.4.56-1_amd64.deb -O /tmp/chef_14.4.56-1_amd64.deb",
      "sudo dpkg -i /tmp/chef_14.4.56-1_amd64.deb",
      "sudo mkdir /tmp/cookbooks",
    ]
  }

  provisioner "file" {
    source      = "jenkins.tgz"
    destination = "/tmp/cookbooks/jenkins.tgz"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cd /tmp/cookbooks",
      "sudo tar xvzf jenkins.tgz",
      "sudo chef-client -zr 'jenkins'",
    ]
  }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }
}
