terraform {
  required_version = ">= 1.15.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.81.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "tfstate" {
  source  = "Scalified/tfstate/azurerm"
  version = "~> 1.0.0"

  project = "myproject"

  allowed_ips = var.allowed_ips

  tags = {
    environment = "production"
    managed_by  = "terraform"
  }
}
