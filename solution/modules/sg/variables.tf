variable "vpc_id" {
  default = ""
}

variable "inbound_rules_cidr_block" {
  type    = "list"
  default = []
}

variable "egress_rules_cidr_block" {
  type    = "list"
  default = []
}

variable "security_group_tag" {
  default = ""
}
