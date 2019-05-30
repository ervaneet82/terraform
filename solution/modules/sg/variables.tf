variable "vpc_id" {
  default = ""
}

variable "egress_rules_cidr_block" {
  type    = "list"
  default = []
}

variable "security_group_tag" {
  default = ""
}

variable "sg_tcp_ports" {
  default = "22,80,443"
}

variable "sg_udp_ports" {
  default = ""
}

variable "sg_tcp_cidrs" {
  type    = "list"
  default = []
}

variable "sg_udp_cidrs" {
  type    = "list"
  default = []
}

variable "sg_udp_rule_description" {
  default = ""
}

variable "sg_tcp_rule_description" {
  default = ""
}

variable "sg_main_description" {
  default = ""
}

variable "sg_main_group_name" {
  default = ""
}
