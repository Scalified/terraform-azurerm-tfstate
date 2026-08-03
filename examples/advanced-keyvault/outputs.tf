output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.tfstate.resource_group_name
}

output "storage_account_name" {
  description = "Name of the created storage account"
  value       = module.tfstate.storage_account_name
}

output "tfstate_container_name" {
  description = "Name of the blob container for Terraform state"
  value       = module.tfstate.tfstate_container_name
}

output "keyvault_name" {
  description = "Name of the created Key Vault"
  value       = module.tfstate.keyvault_name
}

output "keyvault_keys" {
  description = "Map of keys configured in the Key Vault"
  value       = module.tfstate.keyvault_keys
  sensitive   = true
}

output "keyvault_secrets" {
  description = "Map of secrets configured in the Key Vault"
  value       = module.tfstate.keyvault_secrets
  sensitive   = true
}

output "keyvault_uri" {
  description = "The URI of the Key Vault for performing operations on keys and secrets"
  value       = module.tfstate.keyvault_uri
}

output "my_ip" {
  description = "Current public IP address"
  value       = module.tfstate.my_ip
}
