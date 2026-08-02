locals {
  project                = lower(var.project)
  resource_group_name    = coalesce(var.resource_group_name, "rg-${local.project}")
  storage_account_name   = coalesce(var.storage_account_name, "st${local.project}tfstate")
  tfstate_container_name = coalesce(var.tfstate_container_name, "tfstate")
  keyvault_name          = coalesce(var.keyvault_name, "kv-${local.project}")
  allowed_ips            = length(var.allowed_ips) == 0 ? ["${trimspace(data.http.public_ip.response_body)}"] : var.allowed_ips
  tags = merge(var.tags,
    {
      project    = local.project
      managed_by = "terraform"
    }
  )
}
