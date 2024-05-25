######### Config
data "azurerm_client_config" "current" {}

######### Variables
variable "resource_group_name" {
  type    = string
  default = "rg-ninety-test-09"
}

######### Azure RG + KV + Secret Creation
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "uksouth"
}

resource "azurerm_key_vault" "kv" {
  name                = "tamodasdasdpskiiv"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  access_policy {
    tenant_id       = data.azurerm_client_config.current.tenant_id
    object_id       = data.azurerm_client_config.current.object_id
    key_permissions = ["Get", "List"]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete"
    ]
  }
}

resource "azurerm_key_vault_secret" "sa" {
  name         = "sanadsdasdadahgsme1"
  value        = "tamodsdsfdsfpssjhtorage1"
  key_vault_id = azurerm_key_vault.kv.id
}

######### Cretation Storage Account with an exisisting Secret
resource "azurerm_storage_account" "sa" {
  name                     = azurerm_key_vault_secret.sa.value
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [
    azurerm_resource_group.rg
  ]
}