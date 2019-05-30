provider "aws" {}

module "my_vpc" {
  source                      = "modules/vpc"
  vpc_tag                     = "${var.vpc_tag}"
  cidr_block                  = "${var.cidr_block}"
  public_subnet_count         = "${var.public_subnet_count}"
  private_subnet_count        = "${var.private_subnet_count}"
  tenancy                     = "${var.tenancy}"
  enable_dns_support          = "${var.enable_dns_support}"
  enable_ip_address_on_launch = "${var.enable_ip_address_on_launch}"
  igw_tag                     = "${var.igw_tag}"
  public_route_table_tag      = "${var.public_route_table_tag}"
  private_route_table_tag     = "${var.private_route_table_tag}"
  private                     = "${var.private}"
}

module "sg1" {
  source                  = "modules/sg"
  sg_main_group_name      = "${var.sg_main_group_name}"
  sg_main_description     = "${var.sg_main_description}"
  egress_rules_cidr_block = "${var.egress_rules_cidr_block}"
  security_group_tag      = "${var.security_group_tag}"
  sg_tcp_rule_description = "${var.sg_tcp_rule_description}"
  sg_tcp_ports            = "${var.sg_tcp_ports}"
  sg_tcp_cidrs            = "${var.sg_tcp_cidrs}"
  vpc_id                  = "${module.my_vpc.vpc_id}"
  sg_udp_ports            = "${var.sg_udp_ports}"
  sg_udp_cidrs            = "${var.sg_udp_cidrs}"
}
