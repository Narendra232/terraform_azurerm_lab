# checkov:skip=CKV2_AZURE_21: Blob logging is enabled on the parent azurerm_storage_account resource in the storage module
resource "azurerm_storage_container" "container" {
  for_each = var.cntnr

  name               = each.value.name
  storage_account_id = data.azurerm_storage_account.data_container[each.key].id

  # CKV_AZURE_34 / CKV2_AZURE_8 - Always private; never allow public access
  container_access_type = "private"
}
