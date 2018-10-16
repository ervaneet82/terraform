provider "google" {
  credentials = "${file("google.json")}"
  project     = "static-destiny-206401"
  region      = "us-east1"
}

// Create a new instance

resource "google_compute_instance" "default" {
  count        = "${var.num_nodes}"
  name         = "vaneet${count.index + 1}"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  scheduling {
    automatic_restart = false
    preemptible       = true
  }

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size  = "${var.disk_size_gb}"
    }
  }

  metadata {
    ssh-keys = "centos:${file(var.PATH_TO_PUBLIC_KEY)}"
  }

  network_interface {
    network = "default"

    access_config {}
  }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }
}
