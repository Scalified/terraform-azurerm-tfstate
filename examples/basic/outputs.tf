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

output "location" {
  description = "Azure region where resources are created"
  value       = module.tfstate.location
}

output "my_ip" {
  description = "Current public IP address"
  value       = module.tfstate.my_ip
}

output "keyvault_uri" {
  description = "The URI of the Key Vault for performing operations on keys and secrets"
  value       = module.tfstate.keyvault_uri
}
