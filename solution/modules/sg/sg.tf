resource "aws_security_group" "default" {
  name        = "${var.sg_main_group_name}"
  description = "${var.sg_main_description}"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = "${var.egress_rules_cidr_block}"
  description       = "All egress traffic"
  security_group_id = "${aws_security_group.default.id}"
}

resource "aws_security_group_rule" "tcp" {
  count             = "${var.sg_tcp_ports == "default_null" ? 0 : length(split(",", var.sg_tcp_ports))}"
  type              = "ingress"
  from_port         = "${element(split(",", var.sg_tcp_ports), count.index)}"
  to_port           = "${element(split(",", var.sg_tcp_ports), count.index)}"
  protocol          = "tcp"
  cidr_blocks       = "${var.sg_tcp_cidrs}"
  description       = "${var.sg_tcp_rule_description}"
  security_group_id = "${aws_security_group.default.id}"
}

resource "aws_security_group_rule" "udp" {
  count             = "${var.sg_udp_ports == "default_null" ? 0 : length(split(",", var.sg_udp_ports))}"
  type              = "ingress"
  from_port         = "${element(split(",", var.sg_udp_ports), count.index)}"
  to_port           = "${element(split(",", var.sg_udp_ports), count.index)}"
  protocol          = "udp"
  cidr_blocks       = ["${var.sg_udp_cidrs}"]
  description       = "${var.sg_udp_rule_description}"
  security_group_id = "${aws_security_group.default.id}"
}
