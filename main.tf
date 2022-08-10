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
