data "azurerm_public_ip" "nat_pip" {
  for_each            = var.nat_gateways
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "nat_subnet" {
  for_each             = var.nat_gateways
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}
