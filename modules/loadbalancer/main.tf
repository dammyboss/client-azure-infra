resource "azurerm_lb" "lbspokeweb" {
  name                = "${var.env}-lbspokeweb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name = "${var.env}-PrivateIPAddress"
    subnet_id = var.loadbalancer_subnet_id
  }
}
resource "azurerm_lb_backend_address_pool" "lb-backendpool" {
  loadbalancer_id     = azurerm_lb.lbspokeweb.id
  name                = "${var.env}-BackEndAddressPool"
}
resource "azurerm_lb_rule" "lb_rule" {
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lbspokeweb.id
  name                           = "${var.env}-LBRule"
  protocol                       = "tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "${var.env}-PrivateIPAddress"
  enable_floating_ip             = false
  backend_address_pool_id        = azurerm_lb_backend_address_pool.lb-backendpool.id
  idle_timeout_in_minutes        = 5
  probe_id                       = azurerm_lb_probe.lb_probe.id
  depends_on                     = [azurerm_lb_probe.lb_probe]
}

resource "azurerm_lb_probe" "lb_probe" {
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lbspokeweb.id
  name                = "${var.env}-tcpProbe"
  protocol            = "tcp"
  port                = 80
  interval_in_seconds = 5
  number_of_probes    = 2
}
