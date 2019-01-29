variable "db_instance_class" {
  default = "db.t2.micro"
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
  default = "2"
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
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable "rds_subnet_id" {
  type    = "list"
  default = []
}
