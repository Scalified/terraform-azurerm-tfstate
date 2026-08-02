# Terraform Azure Remote State

[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Scalified/terraform-azurerm-tfstate/blob/master/LICENSE)
[![Release](https://img.shields.io/github/v/release/Scalified/terraform-azurerm-tfstate?style=flat-square)](https://github.com/Scalified/terraform-azurerm-tfstate/releases/latest)

A reusable **Terraform** module for provisioning **Azure** infrastructure for secure remote **Terraform** state storage.

The module creates the following resources:

* Azure Resource Group
* Azure Storage Account
* Azure Blob Container
* Azure Key Vault

## Requirements

| Name                                                                             | Version     |
|----------------------------------------------------------------------------------|-------------|
| [Terraform](https://developer.hashicorp.com/terraform)                           | `>= 1.15.0` |
| [http](https://registry.terraform.io/providers/hashicorp/http/latest/docs)       | `~> 3.6.0`  |
| [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) | `~> 4.81.0` |

## Usage

### Example

```hcl
module "tfstate" {
  source  = "Scalified/tfstate/azurerm"
  version = "~> 1.0.0"

  project = "myproject"
  tags = {
    environment = "production"
  }
}
```

```bash
terraform apply -var='allowed_ips=["203.0.113.0/24", "198.51.100.10/32"]'
```

## Inputs

| Name                     | Description                                                           | Type           | Default        | Required |
|--------------------------|-----------------------------------------------------------------------|----------------|----------------|----------|
| `project`                | Project identifier used for naming and tagging resources              | `string`       |                | yes      |
| `location`               | Azure region where all resources will be created                      | `string`       | `"westeurope"` | no       |
| `allow_my_ip`            | Whether to include the current public IP in the allowed_ips list      | `bool`         | `true`         | no       |
| `allowed_ips`            | List of public IPv4/IPv6 CIDRs allowed to access restricted endpoints | `list(string)` | `[]`           | no       |
| `tags`                   | Map of tags applied to all created resources                          | `map(string)`  | `{}`           | no       |
| `resource_group_name`    | Name of the project resource group                                    | `string`       | `null`         | no       |
| `storage_account_name`   | Name of the project storage account                                   | `string`       | `null`         | no       |
| `tfstate_container_name` | Name of the project storage account container for terraform state     | `string`       | `null`         | no       |
| `keyvault_name`          | Name of the project key vault                                         | `string`       | `null`         | no       |
| `keyvault_keys`          | A map of keys to create on the Key Vault                              | `map(object)`  | `{}`           | no       |
| `keyvault_secrets`       | A map of secrets to create on the Key Vault                           | `map(object)`  | `{}`           | no       |
| `keyvault_secrets_value` | A map of secret keys to values                                        | `map(string)`  | `null`         | no       |

### `keyvault_keys` Object

The `keyvault_keys` variable accepts a map with the following attributes:

| Name              | Description                                       | Type          | Required         |
|-------------------|---------------------------------------------------|---------------|------------------|
| `name`            | Name of the key                                   | `string`      | yes              |
| `key_type`        | Type of key (RSA or EC)                           | `string`      | yes              |
| `key_opts`        | List of key operations                            | `list(string)`| no               |
| `key_size`        | Size of the RSA key                               | `number`      | required for RSA |
| `curve`           | Elliptic curve name (P-256, P-256K, P-384, P-521) | `string`      | no               |
| `not_before_date` | Not before date                                   | `string`      | no               |
| `expiration_date` | Expiration date                                   | `string`      | no               |
| `tags`            | Tags for the key                                  | `map(string)` | no               |
| `rotation_policy` | Rotation policy configuration                     | `object`      | no               |

### `keyvault_secrets` Object

The `keyvault_secrets` variable accepts a map with the following attributes:

| Name              | Description                | Type          | Required |
|-------------------|----------------------------|---------------|----------|
| `name`            | Name of the secret         | `string`      | yes      |
| `content_type`    | Content type of the secret | `string`      | no       |
| `tags`            | Tags for the secret        | `map(string)` | no       |
| `not_before_date` | Not before date            | `string`      | no       |
| `expiration_date` | Expiration date            | `string`      | no       |

## Outputs

| Name                     | Description                                                                       |
|--------------------------|-----------------------------------------------------------------------------------|
| `project`                | Project identifier (lowercased) used for naming and tagging resources             |
| `resource_group_name`    | Name of the resource group (either provided or computed)                          |
| `storage_account_name`   | Name of the storage account (either provided or computed)                         |
| `tfstate_container_name` | Name of the storage container for Terraform state (either provided or computed)   |
| `keyvault_name`          | Name of the Key Vault (either provided or computed)                               |
| `my_ip`                  | Current public IP address (from api.ipify.org)                                    |
| `allowed_ips`            | List of allowed IP addresses (computed from var.allowed_ips and optionally my_ip) |
| `tags`                   | Computed tags applied to resources                                                |
| `location`               | Azure region where resources are created                                          |
| `keyvault_keys`          | Map of keys configured in the Key Vault                                           |
| `keyvault_secrets`       | Map of secrets configured in the Key Vault                                        |

---

**Made with ❤️ by [Scalified](http://www.scalified.com)**
