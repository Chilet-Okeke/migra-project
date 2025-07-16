resource "google_compute_firewall" "allow_from_onprem" {
name = "${network_name}-allow-from-onprem"
network = "var.network_name"
allow {
    protocol = ["tcp", "udp", "icmp"]
    ports = ["22"]
  }
source_ranges = "var.onprem_ha-connect_source_ranges"
}


# testing
resource "google_compute_firewall" "allow_from_cloud" {
  name = "${network_name}-allow-from-cloud"
  network = "var.network_name"
  allow {
    protocol = ["tcp", "udp", "icmp"]
    ports = ["22"]
  }
  source_ranges = "var.cloud_ha-connect_source_ranges"
}

resource "google_compute_vpn_gateway" "cloud_vpn_gateway" {
  name = "${network_name}-vpn-gateway"
  network = "var.network_name"
  region = "var.network_region1"
  description = "VPN Gateway for cloud to internet"
}

resource "google_compute_router" "cloud_router" {
    name = "${network_name}-router"
    region = "var.network_region1"
    network = "var.network_name"
    bgp {
      asn = "var.onprem-asn"
    }
}

resource "google_compute_vpn_tunnel" "cloud_vpn_tunnel-0" {
  name = "${network_name}-vpn-tunnel-0"
  region = "var.network_region1"
  shared_secret = "var.cloud_vpn_shared_secret"
  peer_ip = "10.0.0.2"
  vpn_gateway = google_compute_vpn_gateway.cloud_vpn_gateway.id
  router = google_compute_router.cloud_router.id
  vpn_gateway_interface = 0
}

resource "google_compute_vpn_tunnel" "cloud_vpn_tunnel-1" {
name = "${network_name}-vpn-tunnel-1"
region = "var.network_region1"
shared_secret = "var.cloud_vpn_shared_secret"
peer_ip = "var.onprem-router-ip"   #ip address of onprem-internet router 
vpn_gateway = google_compute_vpn_gateway.cloud_vpn_gateway.id
router = google_compute_router.cloud_router.id
vpn_gateway_interface = 1
}

resource "google_compute_router_interface" "tunnel-0_to_onprem" {
  name = "tunnel-0_to_onprem"
  region = "var.network_region1"
  router = google_compute_router.cloud_router.id
  vpn_tunnel = google_compute_vpn_tunnel.cloud_vpn_tunnel-0.id
  ip_range = "var.bgp_tunnel-0_cidr"   #cidr with /30 is prefered... 169.254.0.1/30
}

resource "google_compute_router_interface" "tunnel-1_to_onprem" {
name = "tunnel-1_to_onprem"
region = "var.network_region1"
router = google_compute_router.cloud_router.id
vpn_tunnel = google_compute_vpn_tunnel.cloud_vpn_tunnel-1.id
ip_range = "var.bgp_tunnel-1_cidr"   # 169.254.0.2/30
}
  
resource "google_compute_router_peer" "bgp-tunnel-0" {
  name = "bgp_to_onprem_tunnel-0"
  router = google_compute_router.cloud_router.id
  region = "var.network_region1"
  interface = google_compute_router_interface.tunnel-0_to_onprem.id
  peer_ip_address = "var.onprem_tunnel-0_ip" #internal tunnel ip address of onprem-internet router tunnel-0
  peer_asn = "var.onprem-asn"
}
  
resource "google_compute_router_peer" "bgp-tunnel-1" {
  name = "bgp_to_onprem_tunnel-1"
  router = google_compute_router.cloud_router.id
  region = "var.network_region1"
  interface = google_compute_router_interface.tunnel-1_to_onprem.id
  peer_ip_address = "var.onprem_tunnel-1_ip" #internal tunnel ip address of onprem-internet router tunnel-1
  peer_asn = "var.onprem-asn"
}

