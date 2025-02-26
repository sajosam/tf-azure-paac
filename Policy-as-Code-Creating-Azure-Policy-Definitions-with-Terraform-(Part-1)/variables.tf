# Specifies the Azure subscription ID.
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

# Specifies the Azure Client ID for authentication.
variable "client_id" {
  description = "Azure Client ID"
  type = string
}

# Specifies the Azure Client Secret for authentication.
variable "client_secret" {
  description = "Azure Client Secret"
  type = string
}

# Specifies the Azure Tenant ID for authentication.
variable "tenant_id" {
  description = "Azure Tenant ID"
  type = string
}

# Specifies the Management Group ID where the policy definition should be created.
variable "management_group_id" {
  type        = string
  description = "The management group ID where the policy definition should be created."
  default     = "/providers/Microsoft.Management/managementGroups/PRINCE_JOSE_DEV"

}
