resource "azuread_application" "terraform-sp" {
  name       = "terraform-sp"
  reply_urls = ["http://terraform-sp"]
  type       = "native"
}

resource "azuread_service_principal" "terraform-sp" {
  application_id = "${azuread_application.terraform-sp.application_id}"
}

resource "azuread_service_principal_password" "terraform-sp" {
  service_principal_id = "${azuread_service_principal.terraform-sp.id}"
  value                = "${random_string.application_terraform-sp_password.result}"
  end_date             = "${timeadd(timestamp(), "87600h")}"

  lifecycle {
    ignore_changes = ["end_date"]
  }
}

resource "random_string" "application_terraform-sp_password" {
  length  = 32
  special = true

  keepers = {
    service_principal = "${azuread_service_principal.terraform-sp.id}"
  }
}

resource "azuread_group_member" "example" {
  count            = var.group_member == null ? 0 : length(var.group_member)
  group_object_id  = var.group_member[count.index]
  #group_object_id   = "b6d197ec-1122-420e-81ca-03b8f2854613" # PSPC-CCC-Core ADD Group
  member_object_id = "${azuread_service_principal.terraform-sp.id}"
}

output "client_id" {
  value = "${azuread_service_principal.terraform-sp.application_id}"
}

output "client_secret" {
  value = "${random_string.application_terraform-sp_password.id}"
}

output "tenant_id" {
  value = "${data.azurerm_client_config.current.tenant_id}"
}

output "subscription_id" {
  value = "${data.azurerm_client_config.current.subscription_id}"
}
