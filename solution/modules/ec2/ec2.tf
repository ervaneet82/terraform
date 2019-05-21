resource "aws_instance" "terraform_test" {
  count                       = "${var.instance_count}"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key_name                    = "${aws_key_pair.mykey.key_name}"
  subnet_id                   = "${var.public_subnet}"

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }

  tags {
    Name = "Test-${count.index}"
  }
}
