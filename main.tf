terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.41.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
      skip_provider_registration = true
    }
  }
}

resource "azurerm_resource_group" "example" {
  name     = "tfe-pre-reqs"
  location = "canadacentral"
}

resource "azurerm_dns_zone" "example-public" {
  name                = "azure.jtabbert.sbx.hashidemos.io"
  resource_group_name = azurerm_resource_group.example.name
}
