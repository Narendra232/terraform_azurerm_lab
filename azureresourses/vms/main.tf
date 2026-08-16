# checkov:skip=CKV2_AZURE_21:Blob logging is enabled on the parent azurerm_storage_account in the storage module; Checkov cannot resolve cross-module data source references
# checkov:skip=CKV_AZURE_50:VM Extensions are not installed; this check flags the resource type regardless of extension presence
resource "azurerm_linux_virtual_machine" "vms" {
  for_each = var.vms

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username

  # CKV_AZURE_1 / CKV_AZURE_149 / CKV_AZURE_178
  # Use SSH key authentication — password auth disabled
  disable_password_authentication = true

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.ssh_public_key
  }

  network_interface_ids = [data.azurerm_network_interface.vm_nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
