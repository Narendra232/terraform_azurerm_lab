data "azurerm_subnet" "nic_subnet" {
  for_each             = var.nics
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name


}
data "azurerm_public_ip" "nic_pip" {
  for_each            = var.nics
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}