terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_container" "storage_container_for_backend" {
  name                  = "tfstate"
  storage_account_id    = module.storage.storage_account_id
  container_access_type = "private"
}

resource "random_integer" "dns" {
  min = 10000
  max = 99999
}

module "storage" {
  source = "./modules/storage"

  location                         = azurerm_resource_group.rg.location
  resource_group_name              = azurerm_resource_group.rg.name
  storage_account_name             = var.storage_account_name
  storage_account_tier             = "Standard"
  storage_account_replication_type = "LRS"
  storage_container_name           = var.storage_container_name
}

module "network" {
  source = "./modules/network"

  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  virtual_network_name        = var.virtual_network_name
  vnet_address_prefix         = var.vnet_address_prefix
  subnet_name                 = var.subnet_name
  subnet_address_prefix       = var.subnet_address_prefix
  network_security_group_name = var.network_security_group_name
  public_ip_address_name      = var.public_ip_address_name
  public_ip_allocation_method = "Dynamic"
  dns_label                   = "${var.dns_label_prefix}${random_integer.dns.result}"
  public_ip_sku               = "Basic"
}

module "compute" {
  source = "./modules/compute"

  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  vm_name                   = var.vm_name
  vm_size                   = var.vm_size
  ssh_key_public            = var.ssh_key_public
  subnet_id                 = module.network.subnet_id
  public_ip_address_id      = module.network.public_ip_address_id
  admin_username            = var.admin_username
  computer_name             = var.computer_name
  network_security_group_id = module.network.network_security_group_id
  public_ip_address         = module.network.public_ip_address
  public_ip_fqdn            = module.network.public_ip_fqdn
}
