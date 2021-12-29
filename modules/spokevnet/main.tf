#CREATE SPOKE VNET AND SUBNETS
# Create virtual network
resource "azurerm_virtual_network" "spokevnet" {
  name                = "${var.env}-spokevnet"
  address_space       = ["192.168.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "databases" {
  name                 = "${var.env}-databases"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spokevnet.name
  address_prefixes     = ["192.168.3.0/24"]
}

resource "azurerm_subnet" "frontdoor" {
  name                 = "${var.env}-frontdoor"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spokevnet.name
  address_prefixes     = ["192.168.1.0/24"]
}

resource "azurerm_subnet" "loadbalancer" {
  name                 = "${var.env}-loadbalancer"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spokevnet.name
  address_prefixes     = ["192.168.2.0/24"]

}
resource "azurerm_subnet" "nodes" {
  name                 = "${var.env}-nodes"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spokevnet.name
  address_prefixes     = ["192.168.4.0/24"]
}

resource "azurerm_subnet" "keyvault" {
  name                 = "${var.env}-keyvault"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spokevnet.name
  address_prefixes     = ["192.168.6.0/24"]
}

resource "azurerm_subnet" "pods" {
  name                 = "${var.env}-pods"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spokevnet.name
  address_prefixes     = ["192.168.7.0/24"]
}

resource "azurerm_subnet" "postgresql" {
  name                 = "${var.env}-postgresql"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spokevnet.name
  address_prefixes     = ["192.168.8.0/24"]
  service_endpoints    = ["Microsoft.Sql"]
}