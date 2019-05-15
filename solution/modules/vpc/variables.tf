variable "vpc_tag" {
  default = "custom"
}

variable "subnet_count" {
  default = "50"
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

variable "route_tag" {
  default = "route-table"
}

variable "name" {
  type    = "list"
  default = ["value1", "value1"]
}
