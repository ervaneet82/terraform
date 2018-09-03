provider "google" {
  credentials = "${file("google.json")}"
  project     = "static-destiny-206401"
  region      = "us-central1"
}

// Create a new instance

resource "google_compute_instance" "default" {
  count        = "${var.num_nodes}"
  name         = "node${count.index + 1}"
  machine_type = "n1-highmem-4"
  zone         = "us-central1-a"

  scheduling {
    automatic_restart = true
#    preemptible       = true
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

  provisioner "file" {
    source      = "ambari.repo"
    destination = "/tmp/ambari.repo"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/ambari.repo /etc/yum.repos.d/",
      "sudo iptables -F",
      "sudo systemctl stop firewalld"
    ]
  }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }
}
