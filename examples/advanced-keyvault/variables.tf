variable "allowed_ips" {
  description = "List of public IPv4/IPv6 CIDRs allowed to access restricted endpoints"
  type        = list(string)
  default     = []
}

variable "api_key" {
  description = "API key to store in Key Vault (should be passed via TF_VAR_api_key env var)"
  type        = string
  sensitive   = true
  default     = "placeholder-api-key"
}

variable "db_connection_string" {
  description = "Database connection string to store in Key Vault (should be passed via TF_VAR_db_connection_string env var)"
  type        = string
  sensitive   = true
  default     = "placeholder-connection-string"
}
