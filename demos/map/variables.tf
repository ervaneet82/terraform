variable "nodes" {
  default = "1"
}

variable "region" {
  description = "us-east-1 or us-west-2"
}

variable "ami" {
  type = "map"

  default = {
    us-east-1 = "ami-009d6802948d06e52"
    us-west-2 = "ami-01bbe152bf19d0289"
  }
}

variable "security_group" {
  type = "map"

  default = {
    us-east-1 = "sg-0710ca1f42c4a2e65"
    us-west-2 = "sg-3e8d274f"
  }
}

variable "key_pair" {
  default = "my_aws"
}

variable "instance_type" {
  default = "t2.micro"
}
