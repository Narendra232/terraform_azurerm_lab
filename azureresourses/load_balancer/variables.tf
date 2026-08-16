variable "load_balancers" {
  type = map(object({
    name               = string
    location           = string
    resource_group_name = string
    frontend_ip_name   = string
    backend_pool_name  = string
    health_probe_name  = string
    load_balancing_rule_name = string
  }))
}  
