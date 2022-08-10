resource "azurerm_public_ip" "lab-publicip" {
  name                = var.pip-name
  location            = var.rg-location
  resource_group_name = var.rg-name
  allocation_method   = var.pip-allocation-method
}

resource "azurerm_lb" "lab-loadbalancer" {
  name                = var.lb-name
  location            = var.rg-location
  resource_group_name = var.rg-name

  frontend_ip_configuration {
    name                 = var.frontip-name
    public_ip_address_id = azurerm_public_ip.lab-publicip.id
  }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  resource_group_name = var.rg_name
  loadbalancer_id     = azurerm_lb.lab-loadbalancer.id
  name                = var.lb-backend-name
}

resource "azurerm_lb_backend_address_pool_address" "example" {
  count                   = length(var.lb-backend-address-name)
  name                    = [var.lb-backend-address-name][count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
  virtual_network_id      = [var.vnet_id[lb-backend-address-count.index]]
  ip_address              = [var.vm-ip[count.index]]
}




# # NAT RULE 
# resource "azurerm_lb_nat_rule" "tcp" {
#     resource_group_name = var.rg_name
#     loadbalancer_id = azurerm_lb.lab-loadbalancer.id
#     name = "tcp-rule"
#     protocol = "tcp"
#     frontend_port = "5000"
#     backend_port  = "3389"
#     frontend_ip_configuration_name = "lbfrontendip" 
#     count = 2  
# }

# # LB RULE 
# resource "azurerm_lb_rule" "lb_rule" {
#     resource_group_name = var.rg_name
#     loadbalancer_id = azurerm_lb.lab-loadbalancer.id
#     name = "LBRule"
#     protocol = "tcp"
#     frontend_port = "80"
#     backend_port  = "80"
#     frontend_ip_configuration_name = "lbfrontendip"  
#     enable_floating_ip = false
#     backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id  
#     idle_timeout_in_minutes = 5 
#     probe_id = azurerm_lb_probe.lb_probe.id # not created yet 
#     depends_on = ["azurerm_lb_probe.lb_probe"]
# }

# # LB PROBE
# resource "azurerm_lb_probe" "lb_probe" {
#     resource_group_name = var.rg_name
#     loadbalancer_id = azurerm_lb.lab-loadbalancer.id
#     name = "lbprobe"
#     protocol = "tcp"
#     port = 80
#     interval_in_seconds = 5 
#     number_of_probes = 2 
# }