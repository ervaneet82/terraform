variable "vpc_tag" {
  default = "custom"
}

variable "public_subnet_count" {
  default = "2"
}

variable "private_subnet_count" {
  default = "2"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "enable_dns_support" {
  default = "true"
}

variable "enable_ip_address_on_launch" {
  default = "true"
}

variable "igw_tag" {
  default = "igw"
}

variable "public_route_table_tag" {
  default = "public_route_table"
}

variable "private" {
  default = "private_route_table"
}

variable "name" {
  type    = "list"
  default = ["value1", "value1"]
}
