
variable "rgs" {
  type = map(object({
    name     = string
    location = string
  }))
}
variable "stg" {
  type = map(object({
    name                     = string
    location                 = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "cnt" {
  type = map(object({
    name                  = string
    storage_account_id    = string
    container_access_type = string
  }))
}

variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

variable "ips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
  }))
}

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

variable "vms" {
  type = map(object({
    name                  = string
    location              = string
    resource_group_name   = string
    network_interface_ids = list(string)
    vm_size               = string
    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    storage_os_disk = object({
      name              = string
      caching           = string
      create_option     = string
      managed_disk_type = string
    })
    os_profile = object({
      computer_name  = string
      admin_username = string
      admin_password = string
    })
    os_profile_linux_config = object({
      disable_password_authentication = bool
    })
  }))
}