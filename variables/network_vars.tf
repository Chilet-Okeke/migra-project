variable "network" {
    description = "value"
    type = string
    default = "google_compute_network.Migra-net.id"
}

variable "network_name" {
    description = "value"
    type = string
}

variable "bgp_routing_mode" {
    description = "bgp routing mode"
    type = string
}

variable "network_subnet1_cidr" {
    description = "subnet1 ip range"
    type = string
}

variable "network_subnet2_cidr" {
    description = "subnet2 ip range"
    type = string
}

variable "network_region1" {
    description = "subnet1 region"
    type = string
}

variable "network_region2" {
    description = "subnet2 region"
    type = string
}

variable "firewall_egress_protocol" {
    description = "firewall egress protocol"
    type = any
    default = "tcp"
}

variable "firewall_egress_ports" {
    description = "firewall egress ports"
    type = any
    default = ["80", "443"]
}

variable "firewall_egress_source_ranges" {
    description = "firewall egress source ranges"
    type = any
    default = ["0.0.0.0/0"]
}

variable "firewall_ingress_protocol" {
    description = "firewall ingress protocol"
    type = any
    default = "tcp"
}

variable "firewall_ingress_ports" {
    description = "firewall ingress ports"
    type = any
    default = ["80", "443"]
}

variable "firewall_ingress_source_ranges" {
    description = firewall_ingress_source_ranges
    type = any
   # for security reasons, I'll have to compell the engineer to use a specific allow ingress ip range
   # default = ["10.0.0.0/8"] 
}
