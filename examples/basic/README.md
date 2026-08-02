# Basic Example

This example demonstrates the minimal configuration for provisioning **Azure** infrastructure for **Terraform** remote state storage.

## Resources Created

- Azure Resource Group
- Azure Storage Account
- Azure Blob Container (for Terraform state)
- Azure Key Vault

## Usage

1. Initialize **Terraform**:

   ```bash
   terraform init
   ```

2. Review the plan:

   ```bash
   terraform plan
   ```

3. Apply the configuration:

   ```bash
   terraform apply
   ```

   Or with allowed IPs for network restriction:

   ```bash
   terraform apply -var='allowed_ips=["203.0.113.0/24", "198.51.100.10/32"]'
   ```

## Outputs

After successful apply, the following outputs will be displayed:

- `resource_group_name` - The name of the created resource group
- `storage_account_name` - The name of the storage account
- `tfstate_container_name` - The name of the blob container
- `keyvault_name` - The name of the Key Vault
- `location` - The Azure region
