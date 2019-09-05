terraform {
  required_version = ">= 0.12.1"
}

provider "azurerm" {
  version         = ">= 1.30.0"
  subscription_id = "6ab78209-d09b-44ba-846d-4f716f1e9164"
}
/*
provider "azuread" {
  version = ">=0.5.1"

  subscription_id = "6ab78209-d09b-44ba-846d-4f716f1e9164"
}
*/

#data "azurerm_client_config" "current" {}

module "sp_user1" {
  source = "../."

  sp_name = "user1"
  group_member = ["b6d197ec-1122-420e-81ca-03b8f2854613"]
}

module "sp_user2" {
  source = "../."

  sp_name = "user2"
  group_member = ["b6d197ec-1122-420e-81ca-03b8f2854613"]
}

output "user1" {
  value = module.sp_user1
}

output "user2" {
  value = module.sp_user2
}