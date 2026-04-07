terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.67.0"
    }
  }
}

provider "azurerm" {
  features {}
  client_id = "d2b7cabf-c22b-4088-aa1c-833578cbf829"
  client_secret = "oPN8Q~5Ep~P82bg2Bo5GoM6w2HYqXwVJ8.1SjcJW"
  tenant_id = "6b7f4cde-68e8-4a8f-9e65-c09dd4eccf17"
  subscription_id = "08b5dc63-6f7f-430b-982d-c17d63020ae1"
}