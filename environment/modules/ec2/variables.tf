variable "region" {
  default = "us-east-1"
}

variable "bucket" {
  default = "vaneet1"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "instance_user" {
  default = "ubuntu"
}

variable "instance_count" {
  description = "Number of nodes to create"
}

variable "instance_type" {
  default = ""
}

variable "associate_public_ip_address" {
  default = ""
}

variable "vpc_id" {
  default = ""
}

variable ami {
  default = ""
}
