output "ami id" {
  value = "${data.aws_ami.amazon.id}"
}

output "public ip" {
  value = "${aws_instance.terraform_test.public_ip}"
}

# output "security id" {
#   value = "${data.aws_security_group.my.id}"
# }

