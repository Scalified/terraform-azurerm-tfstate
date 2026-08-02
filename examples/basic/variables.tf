variable "allowed_ips" {
  description = "List of public IPv4/IPv6 CIDRs allowed to access restricted endpoints"
  type        = list(string)
  default     = []
}
