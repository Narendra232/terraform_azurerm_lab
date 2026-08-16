resource "azurerm_network_interface" "name" {
  for_each            = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  ip_configuration {
    name                          = each.value.name_ip_configuration
    subnet_id                     = data.azurerm_subnet.nic_subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.nic_pip[each.key].id
  }

}


