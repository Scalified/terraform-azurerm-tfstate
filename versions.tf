terraform {
  required_version = ">= 1.15.0"

  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3.6.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.81.0"
    }
  }
}

provider "azurerm" {
  features {}
}
