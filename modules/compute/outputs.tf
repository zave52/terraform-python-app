output "vm_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_virtual_machine.vm.id
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_virtual_machine.vm.name
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "public_ip_address" {
  description = "The public IP address of the virtual machine"
  value       = var.public_ip_address
}

output "public_ip_fqdn" {
  description = "The fully qualified domain name of the public IP"
  value       = var.public_ip_fqdn
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.nic.id
}

output "vm_size" {
  description = "The size/SKU of the virtual machine"
  value       = azurerm_virtual_machine.vm.vm_size
}

output "vm_extension_id" {
  description = "The ID of the virtual machine extension"
  value       = azurerm_virtual_machine_extension.vm_extension.id
}
