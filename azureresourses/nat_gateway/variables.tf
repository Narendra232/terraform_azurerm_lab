variable "nat_gateways" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    sku_name                = string
    idle_timeout_in_minutes = number
    public_ip_address_ids   = list(string)
    subnet_ids              = list(string)
  }))
}
