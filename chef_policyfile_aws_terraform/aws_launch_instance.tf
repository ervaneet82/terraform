provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "terraform_test" {
  ami                         = "${data.aws_ami.amazon.id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["sg-01e23ba9d317036eb"]
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  subnet_id                   = "${var.subnet_id}"

  tags {
    Name = "Test"
  }

  provisioner "local-exec" {
    command = "sleep 30;rm -f testpolicy-*.tgz"
  }

  provisioner "local-exec" {
    command = "sleep 60;chef install -D testpolicy.rb;chef export -a -D ${path.cwd}/testpolicy.rb ${path.cwd}/"
  }

  provisioner "local-exec" {
    command = "sleep 60;mv ${path.cwd}/testpolicy-*.tgz ${path.cwd}/testpolicy.tgz;"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir /tmp/chef_zero",
    ]
  }

  provisioner "file" {
    source      = "testpolicy.tgz"
    destination = "/tmp/chef_zero/testpolicy.tgz"
  }

  provisioner "remote-exec" {
    inline = [
      "cd /tmp/chef_zero",
      "tar xvzf testpolicy.tgz",
      "sudo apt-get update",
    ]
  }

  provisioner "chef" {
    client_options = [
      "local_mode true",
      "log_level :warn",
      "chef_repo_path \"/tmp/chef_zero\"",
    ]

    node_name      = "kishore-test"
    use_policyfile = true
    policy_group   = "local"
    policy_name    = "testpolicy"
    server_url     = "http://localhost:8889"
    user_name      = "imjustarobot"
    user_key       = "nothingtoseeherefolks"
    version        = "12"
    log_to_file    = false
  }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
