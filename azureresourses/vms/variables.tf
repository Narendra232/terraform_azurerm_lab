variable "vms" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    # CKV_AZURE_1 / CKV_AZURE_149 / CKV_AZURE_178 - SSH public key (no password auth)
    ssh_public_key = string
  }))
}
