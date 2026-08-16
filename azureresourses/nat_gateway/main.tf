resource "azurerm_nat_gateway" "nat" {
  for_each            = var.nat_gateways
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "nat_pip_assoc" {
  for_each             = var.nat_gateways
  nat_gateway_id       = azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = data.azurerm_public_ip.nat_pip[each.key].id
}

resource "azurerm_subnet_nat_gateway_association" "nat_subnet_assoc" {
  for_each       = var.nat_gateways
  subnet_id      = data.azurerm_subnet.nat_subnet[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat[each.key].id
}
