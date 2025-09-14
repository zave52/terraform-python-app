output "storage_account_id" {
  description = "The ID of the storage account"
  value       = azurerm_storage_account.storage_account.id
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.storage_account.name
}

output "storage_account_primary_endpoint" {
  description = "The primary endpoint URL of the storage account"
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the storage account"
  value       = azurerm_storage_account.storage_account.primary_access_key
  sensitive   = true
}

output "storage_account_secondary_access_key" {
  description = "The secondary access key for the storage account"
  value       = azurerm_storage_account.storage_account.secondary_access_key
  sensitive   = true
}

output "storage_account_connection_string" {
  description = "The primary connection string for the storage account"
  value       = azurerm_storage_account.storage_account.primary_connection_string
  sensitive   = true
}

output "storage_container_id" {
  description = "The ID of the storage container"
  value       = azurerm_storage_container.storage_container.id
}

output "storage_container_name" {
  description = "The name of the storage container"
  value       = azurerm_storage_container.storage_container.name
}

output "storage_container_url" {
  description = "The URL of the storage container"
  value       = "${azurerm_storage_account.storage_account.primary_blob_endpoint}${azurerm_storage_container.storage_container.name}"
}
