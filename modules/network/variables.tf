variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address space for the virtual network in CIDR notation"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet within the virtual network"
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address space for the subnet in CIDR notation"
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group"
  type        = string
}

variable "public_ip_address_name" {
  description = "The name of the public IP address resource"
  type        = string
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP address (Static or Dynamic)"
  default     = "Dynamic"
  type        = string
}

variable "public_ip_sku" {
  description = "The SKU for the public IP address (Basic or Standard)"
  default     = "Standard"
  type        = string
}

variable "dns_label" {
  description = "The DNS label prefix for the public IP address"
  type        = string
}
