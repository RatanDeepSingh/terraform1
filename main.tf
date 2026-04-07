resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = local.resource_location
}

resource "azurerm_virtual_network" "app_network" {
  name                = local.virtual_network.name
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.appgrp.name
  address_space       = local.virtual_network.address_prefixes
 
  tags = {
    environment = "DEV"
  }
}

resource "azurerm_storage_account" "rdsstorageaccount1" {
  name                     = "rdsstorageaccount29"
  resource_group_name      = azurerm_resource_group.appgrp.name
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  depends_on = [ azurerm_resource_group.appgrp ]
  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "scripts" {
  for_each = toset( [ "data","scripts","logs"])
  name = each.key
  storage_account_id = azurerm_storage_account.rdsstorageaccount1.id
}

resource "azurerm_storage_blob" "scripts" {
  for_each = tomap(
    {
      scripts01="scripts01.ps1"
      scripts02="scripts02.ps1"
      scripts03="scripts03.ps1"
    })
  name                    = "${each.key}.ps1"
  storage_account_name    = azurerm_storage_account.rdsstorageaccount1.name
  storage_container_name  = azurerm_storage_container.scripts["scripts"].name
  type                    = "Block"
  source                  = each.value
}