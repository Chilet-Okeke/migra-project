variable "project_id" {
    description = "Your GCP project ID"
    type = string
}

#organization name 
variable "name" {
    description = "organization name- will serve as prefix for major resources"
    type = string
}


variable "primary_resource_region" {
    description = "Primary region for major resources"
    type = string
    default = "us-central1"
}

variable "secondary_resource_region" {
    description = "secondary region for major resources"
    type = string
    default = "europe-west1"
}

variable "create_vpc_network" {
    description = "Choose if you want to create a VPC network"
    type = bool
    #default is set to false because engineer may have already created one and just wants to peer the networks
    default = false
}

variable "create_onprem_network" {
    description = "Choose if you want to create an onprem network"
    type = bool
    #default is set to false because engineer may have already created one and just wants to peer the networks
default = false
}

variable "create_vpn" {
    description = "Choose if you want to create a VPN connection"
    type = bool
    #default is set to true because engineer may have already created one and just wants to peer the networks
    default = true
}

variable "" {
    description = "value"
    type = string
}

variable "" {
    description = "value"
    type = string
}

variable "" {
    description = "value"
    type = string
}