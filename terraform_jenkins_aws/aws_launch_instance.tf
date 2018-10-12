provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "terraform_test" {
  ami                         = "${data.aws_ami.amazon.id}"
  instance_type               = "t2.small"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  subnet_id                   = "${var.subnet_id}"

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
      "wget https://packages.chef.io/files/stable/chef-server/12.17.33/ubuntu/16.04/chef-server-core_12.17.33-1_amd64.deb -O /tmp/chef-server-core_12.17.33-1_amd64.deb",
      "sudo dpkg -i /tmp/chef-server-core_12.17.33-1_amd64.deb",
      "sudo chef-server-ctl reconfigure",
      "sudo chef-server-ctl install chef-manage",
      "sudo chef-server-ctl reconfigure",
      "sudo chef-manage-ctl reconfigure",
    ]
  }

  # provisioner "file" {
  #   source      = "jenkins.tgz"
  #   destination = "/tmp/cookbooks/jenkins.tgz"
  # }


  # provisioner "remote-exec" {
  #   inline = [
  #     "cd /tmp/cookbooks",
  #     "tar xvzf jenkins.tgz",
  #     "sudo chef-client -zr 'jenkins'",
  #   ]
  # }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }
}
