module "avm-res-keyvault-vault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.10.2"

  location            = var.location
  name                = local.keyvault_name
  resource_group_name = local.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  enable_telemetry    = false
  keys                = var.keyvault_keys
  network_acls = {
    default_action = "Deny"
    bypass         = "None"
    ip_rules       = local.allowed_ips
  }
  role_assignments = {
    key_vault_administrator = {
      principal_id               = data.azurerm_client_config.current.object_id
      role_definition_id_or_name = "Key Vault Administrator"
    }
  }
  public_network_access_enabled = true
  secrets                       = var.keyvault_secrets
  secrets_value                 = var.keyvault_secrets_value
  sku_name                      = "standard"
  soft_delete_retention_days    = 30
  tags                          = local.tags

  lock = {
    kind = "CanNotDelete"
    name = "lock-${local.keyvault_name}"
  }
}
