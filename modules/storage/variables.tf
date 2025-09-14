variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure storage account"
  type        = string
}

variable "storage_account_tier" {
  description = "The performance tier of the storage account (Standard or Premium)"
  type        = string
}

variable "storage_account_replication_type" {
  description = "The replication type for the storage account (LRS, GRS, RAGRS, ZRS, etc.)"
  type        = string
}

variable "storage_container_name" {
  description = "The name of the storage container within the storage account"
  type        = string
}
