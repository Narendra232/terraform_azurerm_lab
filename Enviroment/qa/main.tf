module "resource_group" {
  source = "../../azureresourses/resource_groups"
  rgs    = var.rgs
}

module "storage" {
  depends_on = [module.resource_group]
  source     = "../../azureresourses/storage"
  stg        = var.storage
}

module "container" {
  depends_on = [module.storage]
  source     = "../../azureresourses/container"
  cntnr      = var.cnt
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