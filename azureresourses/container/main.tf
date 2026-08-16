resource "azurerm_storage_container" "container" {
  for_each = var.containers

  name               = each.value.name
  storage_account_id = data.azurerm_storage_account.data_container[each.key].id

 
  container_access_type = "private"
}