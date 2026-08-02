# Terraform Azure Remote State - Examples

This directory contains example configurations demonstrating various use cases of the `Scalified/tfstate/azurerm` module.

## Available Examples

### [basic](./basic)

A minimal configuration that creates:

- Resource Group
- Storage Account with Blob Container
- Key Vault

**Best for**: Quick start, testing the module, simple use cases.

### [advanced-keyvault](./advanced-keyvault)

Demonstrates advanced Key Vault features:

- RSA encryption keys with rotation policies
- Secret management
- IP-based network restrictions
- Comprehensive tagging

**Best for**: Production environments requiring enhanced security.

### [existing-resources](./existing-resources)

Shows how to use custom resource names:

- Pre-defined resource group name
- Custom storage account name
- Specific Key Vault naming

**Best for**: Organizations with strict naming conventions or migrating existing resources.

## Quick Start

1. Navigate to an example directory:

   ```bash
   cd examples/basic
   ```

2. Initialize Terraform:

   ```bash
   terraform init
   ```

3. Review and apply:

   ```bash
   terraform plan
   terraform apply
   ```

## Notes

- All examples assume Azure CLI is installed and authenticated
- For production use, always specify `allowed_ips` to restrict network access
- Sensitive values should be passed via environment variables (see `advanced-keyvault` example)
