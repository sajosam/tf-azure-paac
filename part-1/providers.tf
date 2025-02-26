# ----------------------------
# Azure Provider Configuration
# ----------------------------
provider "azurerm" {
  features {}

  # Explicit authentication using Service Principal
  subscription_id = var.subscription_id  
  client_id       = var.client_id      
  client_secret   = var.client_secret  
  tenant_id       = var.tenant_id      

  # Prevent Azure CLI from being used for authentication
  # use_msi = false

  # Security hardening: Disable automatic RP registration
  resource_provider_registrations = "none"

  # skip_provider_registration      = true

}
