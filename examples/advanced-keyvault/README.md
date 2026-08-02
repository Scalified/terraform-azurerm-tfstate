# Advanced Key Vault Example

This example demonstrates using the module with **Key Vault** keys and secrets for enhanced security and key management capabilities.

## Features Demonstrated

- **Key Vault Keys**: RSA keys with custom key sizes and rotation policies
- **Key Vault Secrets**: Secure storage for sensitive configuration values
- **Network Security**: IP-based access restrictions
- **Custom Tags**: Comprehensive tagging strategy

## Prerequisites

- Terraform >= 1.15.0
- Azure CLI authenticated with appropriate permissions

## Usage

1. Set sensitive values via environment variables (recommended):

   ```bash
   export TF_VAR_api_key="your-actual-api-key"
   export TF_VAR_db_connection_string="your-database-connection-string"
   ```

2. Initialize **Terraform**:

   ```bash
   terraform init
   ```

3. Plan with your IP address:

   ```bash
   terraform plan -var='allowed_ips=["YOUR_IP/32"]'
   ```

4. Apply the configuration:

   ```bash
   terraform apply -var='allowed_ips=["YOUR_IP/32"]'
   ```

## Security Notes

- **Never commit sensitive values** in `terraform.tfvars` or source code
- Use environment variables or a secure vault for secrets
- The `api_key` and `db_connection_string` variables are marked as `sensitive` to prevent accidental exposure in logs

## Key Rotation Policy

The example includes a rotation policy for the backup encryption key:

- Keys expire after 90 days
- Automatic rotation 30 days before expiry
- Notification 29 days before expiry
