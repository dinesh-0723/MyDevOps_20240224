terraform {
  required_version = ">=1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "stog01"
    container_name       = "stgct01"
    key                  = "terraformdemokvnew.tfstate"
    resource_group_name  = "rg-ninety-test-01"
  }
}
provider "azurerm" {
  features {}
}