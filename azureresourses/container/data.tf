data "azurerm_storage_account" "data_container" {
  for_each            = var.cntnr
  name                = each.value.storage_account_name
  resource_group_name = each.value.resource_group_name

}