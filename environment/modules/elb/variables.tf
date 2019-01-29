variable "instances" {
  type    = "list"
  default = []
}

variable "number_of_instances" {
  default = ""
}

variable "security_groups" {
  type    = "list"
  default = []
}

variable "vpc_id" {
  default = ""
}

variable "instance_ids" {
  type    = "list"
  default = []
}
