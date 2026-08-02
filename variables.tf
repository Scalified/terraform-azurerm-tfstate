variable "project" {
  description = "Project identifier used for naming and tagging resources"
  type        = string
}

variable "location" {
  description = "Azure region where all resources will be created"
  type        = string
  default     = "westeurope"
}

variable "allowed_ips" {
  description = "List of public IPv4/IPv6 CIDRs allowed to access restricted endpoints"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Map of tags applied to all created resources"
  type        = map(string)
  default     = {}
}

variable "resource_group_name" {
  description = "Name of the project resource group"
  type        = string
  default     = null
}

variable "storage_account_name" {
  description = "Name of the project storage account"
  type        = string
  default     = null
}

variable "tfstate_container_name" {
  description = "Name of the project storage account container for terraform state"
  type        = string
  default     = null
}

variable "keyvault_name" {
  description = "Name of the project key vault"
  type        = string
  default     = null
}

variable "keyvault_keys" {
  description = "A map of keys to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time"
  type = map(object({
    name            = string
    key_type        = string
    key_opts        = optional(list(string))
    key_size        = optional(number)
    curve           = optional(string)
    not_before_date = optional(string)
    expiration_date = optional(string)
    tags            = optional(map(string))
    rotation_policy = optional(object({
      automatic = optional(object({
        time_after_creation = optional(string)
        time_before_expiry  = optional(string)
      }))
      expire_after         = optional(string)
      notify_before_expiry = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for key in values(var.keyvault_keys) : (
        contains(["RSA", "EC"], key.key_type)
      )
    ])
    error_message = "key_type possible values are: RSA and EC"
  }
  validation {
    condition = alltrue(flatten([
      for key in values(var.keyvault_keys) : [
        for opt in coalesce(key.key_opts, []) :
        contains(["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"], opt)
      ]
    ]))
    error_message = "key_opts possible values are: decrypt, encrypt, sign, unwrapKey, verify, wrapKey"
  }
  validation {
    condition = alltrue([
      for key in values(var.keyvault_keys) :
      key.key_type != "RSA" || key.key_size != null
    ])
    error_message = "key_size required for RSA key_type"
  }
  validation {
    condition = alltrue([
      for key in values(var.keyvault_keys) :
      key.curve == null || contains(["P-256", "P-256K", "P-384", "P-521"], key.curve)
    ])
    error_message = "curve possible values are: P-256, P-256K, P-384, P-521"
  }
  default = {}
}

variable "keyvault_secrets" {
  description = "A map of secrets to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time"
  type = map(object({
    name            = string
    content_type    = optional(string)
    tags            = optional(map(string))
    not_before_date = optional(string)
    expiration_date = optional(string)
  }))
  default = {}
}

variable "keyvault_secrets_value" {
  description = "A map of secret keys to values.  The map key is the supplied input to var.keyvault_secrets.  The map value is the secret value"
  type        = map(string)
  default     = null
}
