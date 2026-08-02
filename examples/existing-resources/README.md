# Existing Resources Example

This example demonstrates using the module with pre-existing or specifically named Azure resources instead of auto-generated names.

## Use Cases

- **Naming Conventions**: Enforce organizational naming standards
- **Migration**: Use existing resources that were created manually or by other means
- **Consistency**: Maintain predictable resource names across environments

## Resource Naming

| Variable                 | Value                     | Notes                                          |
|--------------------------|---------------------------|------------------------------------------------|
| `resource_group_name`    | `rg-terraform-state-prod` | Custom resource group name                     |
| `storage_account_name`   | `sttfstateprodlegacy`     | 3-24 chars, lowercase letters and numbers only |
| `tfstate_container_name` | `tfstate`                 | Custom blob container name                     |
| `keyvault_name`          | `kv-tfstate-prod-legacy`  | Globally unique, 3-24 chars                    |

## Important Notes

### Storage Account Naming

- Must be **globally unique** across all of Azure
- Only lowercase letters and numbers (no hyphens, no underscores)
- Length: 3-24 characters

### Key Vault Naming

- Must be **globally unique**
- Only alphanumeric characters and hyphens
- Must start with a letter
- Length: 3-24 characters

## Usage

1. Initialize **Terraform**:

   ```bash
   terraform init
   ```

2. Review the plan:

   ```bash
   terraform plan
   ```

3. Apply with allowed IPs:

   ```bash
   terraform apply -var='allowed_ips=["203.0.113.0/24"]'
   ```

## Migration Scenario

When migrating from manually created resources, ensure:

1. The resources exist or Terraform will create them
2. You have appropriate permissions (Owner/Contributor)
3. Existing state files (if any) are backed up
