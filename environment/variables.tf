variable "vpc_id" {
  default = ""
}

variable "region" {
  default = "ap-south-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "instance_user" {
  default = "ec2-user"
}

variable "instance_count" {
  description = "Number of nodes to create"
  default     = 1
}

variable "instance_type" {
  default = "t2.medium"
}

variable "associate_public_ip_address" {
  default = "true"
}

variable "instance_ids" {
  type    = "list"
  default = []
}

variable "ami" {
  default = "ami-035be7bafff33b6b6"
}

variable "public_subnet1_cidr" {
  default = "192.0.1.0/24"
}

variable "public_subnet1_availability_zone" {
  default = "us-east-1a"
}

variable "vpc_cidr_block" {
  default = "192.0.0.0/16"
}

variable "public_subnet" {
  default = ""
}

### Private subnets

variable "private_subnet_1_cidr" {
  default = "192.0.2.0/24"
}

variable "private_subnet_2_cidr" {
  default = "192.0.3.0/24"
}

variable "private_subnet_1_availability_zone" {
  default = "us-east-1b"
}

variable "private_subnet_2_availability_zone" {
  default = "us-east-1c"
}

variable "instance_ip" {
  default = ""
}

variable "bucket" {
  default = "riya-dev-terraform"
}

### RDS

variable "db_instance_class" {
  default = "db.t2.medium"
}

variable "master_username" {
  default = "test"
}

variable "master_password" {
  default = "test123#"
}

variable "database_name" {
  default = "mydb"
}

variable "instance_count_in_cluster" {
  default = "0"
}

variable "environment_name" {
  default = "test"
}

variable "manager" {
  default = "dbmgr"
}

variable "db_subnet_group_name" {
  default = "testsubnet"
}

variable "vpc_security_group_ids" {
  default = ""
}

variable "cluster_identifier" {
  default = "riya-dev-terraform"
}

variable "rds_vpc_id" {
  default = ""
}
