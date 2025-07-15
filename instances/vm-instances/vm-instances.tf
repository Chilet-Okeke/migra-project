resource "google_compute_instance" "cloud-instance1" {
    name = "${var.name}-instance1"
    machine_type = "var.instance1_machine-type" #default "e2-medium-2"
    zone = "var.instance1_zone" #default "us-central1-a"
boot_disk {
  initialize_params {
    image = "var.instance1_image" #default "debian-cloud/debian-11"
  }
}
network_interface {
  network = "var.instance1_network" #default "default"
  access_config {
    // Ephemeral IP
  }
}
}

resource "google_compute_instance" "cloud-instance2" {
    name = "${var.name}-instance"
  machine_type = "var.instance2_machine-type" #default "e2-medium-2"
  zone = "var.instance2_zone" #default "europe-west1-b"
  boot_disk {
    initialize_params {
      image = "var.instance2_image" #default "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "var.instance2_network" #default "default"
    access_config {
      // Ephemeral IP
    }
  }
}
 