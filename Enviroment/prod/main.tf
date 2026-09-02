module "resource_group" {
  source = "../../azureresourses/rg"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.resource_group]
  source     = "../../azureresourses/vnets"
  vnets      = var.vnets
}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../azureresourses/subnets"
  subnets    = var.subnets
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../azureresourses/ips"
  ips        = var.ips
}
module "nic" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../azureresourses/nic"
  nics       = var.nics
}
module "vm" {
  depends_on = [module.nic]
  source     = "../../azureresourses/vms"
  vms        = var.vms

}
