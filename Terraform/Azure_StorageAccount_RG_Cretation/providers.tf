# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "azurerm" {
    storage_account_name = "stog01"
    container_name       = "stgct01"
    key                  = "terraformdemo.tfstate"
    resource_group_name  = "rg-ninety-test-01"
    #access_key           = "myaccesskey"
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}