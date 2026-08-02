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

  project  = "legacyproject"
  location = "westeurope"

  resource_group_name    = "rg-terraform-state-prod"
  storage_account_name   = "sttfstateprodlegacy"
  tfstate_container_name = "tfstate"
  keyvault_name          = "kv-tfstate-prod-legacy"

  allowed_ips = var.allowed_ips

  keyvault_keys = {
    state_encryption = {
      name     = "state-encryption-key"
      key_type = "RSA"
      key_size = 4096
      key_opts = ["encrypt", "decrypt", "wrapKey", "unwrapKey"]
    }
  }

  tags = {
    environment = "production"
    managed_by  = "terraform"
    project     = "legacy-migration"
  }
}
