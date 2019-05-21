module "sg1" {
  source              = "modules/sg"
  tcp_ports           = "22,80,443"
  cidrs               = ["10.0.0.5/32", "10.0.0.50/32", "10.0.0.200/32"]
  security_group_name = "SomeGroup"
  vpc_id              = "${aws_vpc.this_vpc.id}"
}

module "sg2" {
  source              = "modules/sg"
  tcp_ports           = "22,80,443"
  cidrs               = ["10.0.0.5/32", "10.0.0.50/32", "10.0.0.200/32"]
  security_group_name = "SomeOtherGroup"
  vpc_id              = "${aws_vpc.this_vpc.id}"
}
