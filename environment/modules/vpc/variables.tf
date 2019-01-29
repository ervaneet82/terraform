variable "vpc_cidr_block" {
  default = ""
}

variable "public_subnet1_cidr" {
  default = ""
}

variable "public_subnet2_cidr" {
  default = ""
}

variable "public_subnet1_availability_zone" {
  default = ""
}

variable "public_subnet2_availability_zone" {
  default = ""
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

### Private Subnets

variable "private_subnet_1_cidr" {
  default = ""
}

variable "private_subnet_2_cidr" {
  default = ""
}

variable "private_subnet_1_availability_zone" {
  default = ""
}

variable "private_subnet_2_availability_zone" {
  default = ""
}
