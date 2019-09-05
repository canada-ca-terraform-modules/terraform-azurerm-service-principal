terraform {
  required_version = ">= 0.12.1"
}

provider "azurerm" {
  version         = ">= 1.30.0"
  #subscription_id = "6ab78209-d09b-44ba-846d-4f716f1e9164"
}
provider "azuread" {
  version = ">=0.5.1"

  #subscription_id = "6ab78209-d09b-44ba-846d-4f716f1e9164"
}

data "azurerm_client_config" "current" {}