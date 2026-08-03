output "project" {
  description = "Project identifier (lowercased) used for naming and tagging resources"
  value       = local.project
}

output "resource_group_name" {
  description = "Name of the resource group (either provided or computed)"
  value       = local.resource_group_name
}

output "storage_account_name" {
  description = "Name of the storage account (either provided or computed)"
  value       = local.storage_account_name
}

output "tfstate_container_name" {
  description = "Name of the storage container for Terraform state (either provided or computed)"
  value       = local.tfstate_container_name
}

output "keyvault_name" {
  description = "Name of the Key Vault (either provided or computed)"
  value       = local.keyvault_name
}

output "my_ip" {
  description = "Current public IP address (from api.ipify.org)"
  value       = data.http.public_ip.response_body
}

output "allowed_ips" {
  description = "List of allowed IP addresses (computed from var.allowed_ips and optionally my_ip)"
  value       = local.allowed_ips
}

output "tags" {
  description = "Computed tags applied to resources"
  value       = local.tags
}

output "location" {
  description = "Azure region where resources are created"
  value       = var.location
}

output "keyvault_keys" {
  description = "Map of keys configured in the Key Vault"
  value       = var.keyvault_keys
}

output "keyvault_secrets" {
  description = "Map of secrets configured in the Key Vault"
  value       = var.keyvault_secrets
}

output "keyvault_uri" {
  description = "The URI of the Key Vault for performing operations on keys and secrets"
  value       = module.avm-res-keyvault-vault.uri
}
