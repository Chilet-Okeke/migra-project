output "migra_network_id" {
  description = "ID of the VPC network"
  value = google_compute_network.Migra-net.id
}

output "migra_network_name" {
 description = "Name of the VPC network"
  value = google_compute_network.Migra-net.name
}

output "VM_instance-1_internal-ip" {
   description = "Internal IP address of VM instance 1"
  value = google_compute_instance.Migra-vm1.network_interface.0.network_ip
}

output "VM_instance-2_internal-ip" {
   description = "Internal IP address of VM instance 2"
  value = google_compute_instance.Migra-vm2.network_interface.0.network_ip
}
