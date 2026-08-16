resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}

# CKV2_AZURE_31 - Each subnet must have an NSG associated
resource "azurerm_network_security_group" "subnet_nsg" {
  for_each            = var.subnets
  name                = "${each.value.name}-nsg"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  for_each                  = var.subnets
  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = azurerm_network_security_group.subnet_nsg[each.key].id
}