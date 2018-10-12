output "ami id" {
  value = "${data.aws_ami.amazon.id}"
}

output "public ip" {
  value = "${aws_instance.terraform_test.public_ip}"
}

# output "bucket name" {
#   value = "${aws_s3_bucket.terraform_test.bucket}"
# }

