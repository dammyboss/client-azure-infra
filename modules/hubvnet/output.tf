output "hubvnet_id" {
  value = azurerm_virtual_network.hubvnet.id
}
output "hub_virtual_network_name" {
  value = azurerm_virtual_network.hubvnet.name
}
output "bastion_subnet_id" {
  value = azurerm_subnet.AzureBastionSubnet.id
}
output "firewall_subnet_id" {
  value = azurerm_subnet.AzureFirewallSubnet.id
}