data "aws_subnet_ids" "selected" {
  vpc_id = "${var.vpc_id}"
}

resource "aws_elb" "my-elb" {
  name            = "my-elb"
  subnets         = ["${data.aws_subnet_ids.selected.ids}"]
  security_groups = ["${var.security_groups}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = ["${var.instance_ids}"]
  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 120

  tags {
    Name = "my-elb"
  }
}
