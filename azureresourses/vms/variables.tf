variable "vms" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    nic_name            = string
    admin_password      = string
  }))
}
