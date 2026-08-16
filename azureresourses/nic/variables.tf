variable "nics" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    virtual_network_name          = string
    name_ip_configuration         = string
    subnet_name                   = string
    private_ip_address_allocation = string
    pip_name                      = string
  }))
}