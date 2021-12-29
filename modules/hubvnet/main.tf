# Create HUB VNET AND SUBNETS
# Create virtual network
resource "azurerm_virtual_network" "hubvnet" {
  name                = "${var.env}-hubvnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}
//resource "azurerm_subnet" "subnets" {
//  count = length(var.subnet)
//  name = var.subnet[count.index]
//  resource_group_name = var.resource_group_name
//  virtual_network_name = azurerm_virtual_network.hubvnet.name
//  address_prefixes = [var.address_prefixes[count.index]]
//}
//variable "subnet" {
//  type = list(string)
//  default = ["GatewaySubnet","managementsubnet"]
//}
//variable "address_prefixes" {
//  type = list(string)
//  default = ["10.0.1.0/27","10.0.2.0/24"]
//}
# Create subnet
resource "azurerm_subnet" "gatewaysubnet" {
  name                 = "${var.env}-GatewaySubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  address_prefixes     = ["10.0.1.0/27"]
}

resource "azurerm_subnet" "managementsubnet" {
  name                 = "${var.env}-managementsubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "AzureFirewallSubnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  address_prefixes     = ["10.0.8.0/26"]
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hubvnet.name
  address_prefixes     = ["10.0.10.0/27"]
}