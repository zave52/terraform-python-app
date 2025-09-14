output "virtual_network_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "virtual_network_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.subnet.id
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.subnet.name
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the subnet"
  value       = azurerm_subnet.subnet.address_prefixes
}

output "network_security_group_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.nsg.id
}

output "network_security_group_name" {
  description = "The name of the network security group"
  value       = azurerm_network_security_group.nsg.name
}

output "public_ip_address_id" {
  description = "The ID of the public IP address"
  value       = azurerm_public_ip.pip.id
}

output "public_ip_address" {
  description = "The public IP address"
  value       = azurerm_public_ip.pip.ip_address
}

output "public_ip_fqdn" {
  description = "The fully qualified domain name of the public IP"
  value       = azurerm_public_ip.pip.fqdn
}

output "dns_label" {
  description = "The DNS label of the public IP"
  value       = azurerm_public_ip.pip.domain_name_label
}
