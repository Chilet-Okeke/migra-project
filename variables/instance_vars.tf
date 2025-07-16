variable "instance1_machine-type" {
    description = "Compute Engine machine type for VM-1 instances"
    type = string
    default = "e2-medium-2"
}

variable "instance1_zone" {
    description = "Zone for VM-1"
    type = string
    default = "us-central1-f"
}

variable "instance1_image" {
    description = "OS image for VM-1"
    type = string
    default = "debian-cloud/debian-11-bullseye"
}

variable "instance1_network" {
    description = "network for VM-1"
    type = string
    default = var.network_name
}

variable "instance2_machine-type" {
    description = "Compute Engine instance type for VM-2"
    type = string
    default = "e2-medium-2"
}

variable "instance2_zone" {
    description = "Zone for VM-2"
    type = string
    default = "europe-west1-b"
}


variable "instance2_image" {
    description = "OS image for VM-2"
    type = string
}

variable "instance2_network" {
    description = "network for VM-2"
    type = string
    default = var.network_name
}