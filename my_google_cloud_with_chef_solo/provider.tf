provider "google" {
  credentials = "${file("google.json")}"
  project     = "static-destiny-206401"
  region      = "us-central1"
}

// Create a new instance

data "template_file" "dna" {
  template = "${file("dna.json.tpl")}"

  vars {
    recipe = "apache::default"
  }
}

resource "google_compute_instance" "default" {
  count        = "${var.num_nodes}"
  name         = "node${count.index + 1}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

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

  provisioner "file" {
    source      = "cookbooks.tgz"
    destination = "/tmp/cookbooks.tgz"
  }

  provisioner "file" {
    content     = "${data.template_file.dna.rendered}"
    destination = "/tmp/dna.json"
  }

  provisioner "remote-exec" {
    inline = [
      "curl -LO https://www.chef.io/chef/install.sh && sudo bash ./install.sh",
      "sudo chef-solo --recipe-url /tmp/cookbooks.tgz -j /tmp/dna.json",
    ]
  }

  connection {
    user        = "${var.instance_user}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout     = "10m"
  }
}
