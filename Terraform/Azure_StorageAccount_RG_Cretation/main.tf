variable "environment" {
  type    = string
  #default = "staging"
  default = "production"
}

resource "azurerm_resource_group" "rg" {
  name     = "tamops-resource"
  location = "Uk South"
}

resource "azurerm_storage_account" "sa" {
  name                     = "tamopssaa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = var.environment == "production" ? "GRS" :"LRS"
}