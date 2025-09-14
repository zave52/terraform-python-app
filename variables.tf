variable "location" {
  description = "The Azure region where resources will be deployed"
  default     = "uksouth"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group"
  default     = "django-todolist"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network"
  default     = "vnet"
  type        = string
}

variable "vnet_address_prefix" {
  description = "The address space for the virtual network in CIDR notation"
  default     = "10.0.0.0/16"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet within the virtual network"
  default     = "default"
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address space for the subnet in CIDR notation"
  default     = "10.0.0.0/24"
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group"
  default     = "defaultnsg"
  type        = string
}

variable "public_ip_address_name" {
  description = "The name of the public IP address resource"
  default     = "linuxboxpip"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  default     = "vmbox"
  type        = string
}

variable "vm_size" {
  description = "The size/SKU of the virtual machine"
  default     = "Standard_B1s"
  type        = string
}

variable "ssh_key_public" {
  description = "The public SSH key for VM authentication"
  type        = string
}

variable "dns_label_prefix" {
  description = "The DNS label prefix for the public IP address"
  default     = "matetask"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure storage account"
  type        = string
}

variable "storage_container_name" {
  description = "The name of the storage container within the storage account"
  default     = "artifacts"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the virtual machine"
  default     = "testadmin"
  type        = string
}

variable "computer_name" {
  description = "The computer name/hostname for the virtual machine"
  default     = "hostname"
  type        = string
}
