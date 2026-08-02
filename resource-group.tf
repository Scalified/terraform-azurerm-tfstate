module "resource_group" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "0.4.0"

  location         = var.location
  name             = local.resource_group_name
  enable_telemetry = false
  tags             = local.tags

  lock = {
    kind = "CanNotDelete"
    name = "lock-${local.resource_group_name}"
  }
}
