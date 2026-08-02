module "storage_account" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "0.7.3"

  location  = var.location
  name      = local.storage_account_name
  parent_id = module.resource_group.resource_id

  access_tier                     = "Hot"
  account_kind                    = "StorageV2"
  account_sku_name                = "Standard_LRS"
  allow_nested_items_to_be_public = false
  blob_properties = {
    container_delete_retention_policy = {
      days = 30
    }
    delete_retention_policy = {
      days = 30
    }
    versioning_enabled = true
  }
  containers = {
    tfstate = {
      name = local.tfstate_container_name
    }
  }
  enable_telemetry           = false
  https_traffic_only_enabled = true
  min_tls_version            = "TLS1_2"
  network_rules = {
    default_action = "Deny"
    bypass         = []
    ip_rules       = local.allowed_ips
  }
  public_network_access_enabled = true
  role_assignments = {
    storage_blob_data_owner = {
      principal_id               = data.azurerm_client_config.current.object_id
      role_definition_id_or_name = "Storage Blob Data Owner"
    }
  }
  shared_access_key_enabled = false
  tags                      = local.tags

  lock = {
    kind = "CanNotDelete"
    name = "lock-${local.storage_account_name}"
  }
}
