output "external_ip" {
  value = "${google_compute_instance.default.*.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "hostnames" {
  value = "${google_compute_instance.default.*.name}"
}
