resource "aws_instance" "terraform_test" {
  ami                         = "${data.aws_ami.amazon.id}"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.mykey.key_name}"

  tags {
    Name = "Test"
  }
}
