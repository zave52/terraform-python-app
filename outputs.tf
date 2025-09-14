output "virtual_network_id" {
  description = "The ID of the virtual network"
  value       = module.network.virtual_network_id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = module.network.subnet_id
}

output "public_ip_address" {
  description = "The public IP address of the virtual machine"
  value       = module.network.public_ip_address
}

output "public_ip_fqdn" {
  description = "The fully qualified domain name of the public IP"
  value       = module.network.public_ip_fqdn
}

output "network_security_group_id" {
  description = "The ID of the network security group"
  value       = module.network.network_security_group_id
}

output "vm_id" {
  description = "The ID of the virtual machine"
  value       = module.compute.vm_id
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = module.compute.vm_name
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value       = module.compute.vm_private_ip
}

output "vm_size" {
  description = "The size/SKU of the virtual machine"
  value       = module.compute.vm_size
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value       = module.compute.network_interface_id
}

output "storage_account_id" {
  description = "The ID of the storage account"
  value       = module.storage.storage_account_id
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.storage.storage_account_name
}

output "storage_account_primary_endpoint" {
  description = "The primary endpoint URL of the storage account"
  value       = module.storage.storage_account_primary_endpoint
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = module.storage.storage_container_name
}

output "storage_container_url" {
  description = "The URL of the storage container"
  value       = module.storage.storage_container_url
}

output "application_url" {
  description = "The URL to access the ToDo List application"
  value       = "http://${module.network.public_ip_address}"
}

output "ssh_connection_command" {
  description = "SSH command to connect to the virtual machine"
  value       = "ssh ${var.admin_username}@${module.network.public_ip_address}"
}
