#### VPC Variables

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

variable "private_route_table_tag" {
  default = "private_route_table"
}

variable "private" {
  default = "private_route_table"
}

### Security groups variables

variable "vpc_id" {
  default = ""
}

variable "egress_rules_cidr_block" {
  type    = "list"
  default = ["0.0.0.0/0"]
}

variable "security_group_tag" {
  default = "my_security_group"
}

variable "sg_tcp_ports" {
  default = "22,80,443"
}

variable "sg_udp_ports" {
  default = ""
}

variable "sg_tcp_cidrs" {
  type    = "list"
  default = ["10.0.0.5/32", "10.0.0.50/32", "10.0.0.200/32"]
}

variable "sg_udp_cidrs" {
  type    = "list"
  default = ["10.0.0.5/32", "10.0.0.50/32", "10.0.0.200/32"]
}

variable "sg_udp_rule_description" {
  default = ""
}

variable "sg_tcp_rule_description" {
  default = ""
}

variable "sg_main_description" {
  default = "my_new_security_group"
}

variable "sg_main_group_name" {
  default = "my_new_security_group"
}
