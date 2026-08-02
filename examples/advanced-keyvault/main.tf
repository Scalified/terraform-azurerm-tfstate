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

  project  = "secureproject"
  location = "eastus2"

  allowed_ips = var.allowed_ips

  keyvault_keys = {
    terraform_encryption = {
      name     = "tf-encryption-key"
      key_type = "RSA"
      key_size = 4096
      key_opts = ["encrypt", "decrypt", "wrapKey", "unwrapKey"]
      tags = {
        purpose = "terraform-state-encryption"
      }
    }
    backup_encryption = {
      name     = "backup-key"
      key_type = "RSA"
      key_size = 2048
      key_opts = ["encrypt", "decrypt"]
      rotation_policy = {
        automatic = {
          time_before_expiry = "P30D"
        }
        expire_after         = "P90D"
        notify_before_expiry = "P29D"
      }
    }
  }

  keyvault_secrets = {
    api_key = {
      name         = "external-api-key"
      content_type = "text/plain"
      tags = {
        environment = "production"
      }
    }
    db_connection = {
      name         = "database-connection-string"
      content_type = "text/plain"
    }
  }

  keyvault_secrets_value = {
    api_key       = var.api_key
    db_connection = var.db_connection_string
  }

  tags = {
    environment = "production"
    managed_by  = "terraform"
    team        = "platform"
    cost_center = "engineering"
  }
}
