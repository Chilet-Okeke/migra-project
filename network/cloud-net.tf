resource "google_compute_network" "Migra-net" {
  name = "var.network_name"
  auto_create_subnetworks = false
  routing_mode = "var.bgp_routing_mode"
  description = "migra_network_for_onprem-cloud_peering"
}

resource "google_compute_subnetwork" "Migra-subnet1" {
  name = "${var.network_name}--subnet1"
  ip_cidr_range = "var.network_subnet1_cidr"
  region = "var.region"
  network = google_compute_network.Migra-net.id
  description = "migra_subnet-1_for_onprem-cloud_peering"
}

resource "google_compute_subnetwork" "Migra-subnet2" {
    name = "${var.network_name}--subnet2"
    ip_cidr_range = "var.network_subnet2_cidr"
    region = "var.region"
    network = google_compute_network.Migra-net.id
    description = "migra_subnet-2_for_onprem-cloud_peering"

  
}