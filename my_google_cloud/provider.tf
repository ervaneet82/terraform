provider "google" {
  credentials = "${file("google.json")}"
  project     = "static-destiny-206401"
  region      = "us-central1"
}

# resource "google_compute_global_address" "default" {
#   name = "global-appserver-ip"
# }

// Create a new instance

resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  scheduling {
    automatic_restart = false
    preemptible       = true
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  metadata {
    ssh-keys = "ubuntu:${file(var.PATH_TO_PUBLIC_KEY)}"
  }

  network_interface {
    network = "default"

    access_config {}
  }
}
