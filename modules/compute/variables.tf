variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size/SKU of the virtual machine"
  type        = string
}

variable "ssh_key_public" {
  description = "The public SSH key for VM authentication"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to which the VM will be connected"
  type        = string
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address resource assigned to the VM"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the virtual machine"
  type        = string
}

variable "computer_name" {
  description = "The computer name/hostname for the virtual machine"
  type        = string
}

variable "network_security_group_id" {
  description = "The ID of the network security group to associate with the VM"
  type        = string
}

variable "public_ip_address" {
  description = "The public IP address of the virtual machine"
  type        = string
}

variable "public_ip_fqdn" {
  description = "The fully qualified domain name of the public IP"
  type        = string
}
