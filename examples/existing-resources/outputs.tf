output "project" {
  description = "Project identifier (lowercased)"
  value       = module.tfstate.project
}

output "resource_group_name" {
  description = "Name of the resource group (user-provided)"
  value       = module.tfstate.resource_group_name
}

output "storage_account_name" {
  description = "Name of the storage account (user-provided)"
  value       = module.tfstate.storage_account_name
}

output "tfstate_container_name" {
  description = "Name of the blob container (user-provided)"
  value       = module.tfstate.tfstate_container_name
}

output "keyvault_name" {
  description = "Name of the Key Vault (user-provided)"
  value       = module.tfstate.keyvault_name
}

output "allowed_ips" {
  description = "List of allowed IP addresses"
  value       = module.tfstate.allowed_ips
}

output "tags" {
  description = "Computed tags applied to resources"
  value       = module.tfstate.tags
}

output "my_ip" {
  description = "Current public IP address"
  value       = module.tfstate.my_ip
}
