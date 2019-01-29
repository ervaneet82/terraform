output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.main.id}"
}

output "vpc_cidr" {
  description = "Private subnet CIDR"
  value       = "${aws_vpc.main.cidr_block}"
}

output "vpc_public_1_subnet_id" {
  description = "Private subnet id"
  value       = "${aws_subnet.main-public-1.id}"
}

output "vpc_public_2_subnet_id" {
  description = "Private subnet id"
  value       = "${aws_subnet.main-public-2.id}"
}

output "vpc_private_1_subnet_id" {
  description = "Private subnet id"
  value       = "${aws_subnet.main-private-1.id}"
}

output "vpc_private_2_subnet_id" {
  description = "Private subnet id"
  value       = "${aws_subnet.main-private-2.id}"
}
