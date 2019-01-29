resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name    = "${var.dns_name}"
  type    = "A"
  ttl     = "60"
  records = ["${instance_ip}"]
}
