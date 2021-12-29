#Configure Virtual Network Peering
resource "azurerm_virtual_network_peering" "Hub-2-Spoke" {
  name                      = "${var.env}-Hub-2-Spoke"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.hub_virtual_network_name
  remote_virtual_network_id = var.spokevnet_id
}

resource "azurerm_virtual_network_peering" "Spoke-2-Hub" {
  name                      = "${var.env}-Spoke-2-Hub"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.spoke_virtual_network_name
  remote_virtual_network_id = var.hubvnet_id
}