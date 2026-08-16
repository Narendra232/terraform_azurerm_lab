data "azurerm_public_ip" "lb_pip" {
  for_each            = var.load_balancers
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}
