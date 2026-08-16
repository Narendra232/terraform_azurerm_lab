
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
    storage_account_name  = string
    resource_group_name   = string
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
    location             = string
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
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    nic_name            = string
    ssh_public_key      = string
  }))
}