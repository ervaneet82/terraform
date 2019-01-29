output "sg_id" {
  description = "The ID of the VPC"
  value       = "${aws_security_group.sg.id}"
}
