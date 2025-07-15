resource "google_compute_network" "Migra-net" {
  name = "var.network_name"
  auto_create_subnetworks = false
  routing_mode = "var.bgp_routing_mode"
  description = "migra_network_for_onprem-cloud_peering"
}

resource "google_compute_subnetwork" "Migra-subnet1" {
  name = "${var.network_name}-subnet1"
  ip_cidr_range = "var.network_subnet1_cidr"
  region = "var.network_region1"
  network = google_compute_network.Migra-net.id
  description = "migra_subnet-1_for_onprem-cloud_peering"
}

resource "google_compute_subnetwork" "Migra-subnet2" {
    name = "${var.network_name}-subnet2"
    ip_cidr_range = "var.network_subnet2_cidr"
    region = "var.network_region2"
    network = google_compute_network.Migra-net.id
    description = "migra_subnet-2_for_onprem-cloud_peering"
}

resource "google_compute_firewall" "Migra-firewall-allow-egress" {
name = "${var.network_name}-firewall-allow-egress"
network = google_compute_network.Migra-net.id
allow {
  protocol =  "var.firewall_egress_protocol"   #default "tcp" -- UDP, SSH, Custom, ICMP
  ports = "var.firewall_egress_ports"   #default ["80", "443"]
  
}
source_ranges = "var.firewall_egress_source_ranges" #["0.0.0.0/0"]
direction = "EGRESS"
description = "migra_firewall_allow_egress"
}

resource "google_compute_firewall" "name" {
  name = "${var.network_name}-firewall-allow-ingress"
  network = google_compute_network.Migra-net.id
  allow {
    protocol = "var.firewall_ingress_protocol" #default "tcp"
    ports = "var.firewall_ingress_ports" #default "80"
  }
  source_ranges = "var.firewall_ingress_source_ranges" #default "0.0.0.0/0"
  direction = "INGRESS"
  description = "migra_firewall_allow_ingress"
}
