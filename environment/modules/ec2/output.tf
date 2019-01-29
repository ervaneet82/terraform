output "instance_ids" {
  value = ["${aws_instance.terraform_test.*.id}"]
}
