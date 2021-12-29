output "spokevnet_id" {
  value = azurerm_virtual_network.spokevnet.id
}
output "spoke_virtual_network_name" {
  value = azurerm_virtual_network.spokevnet.name
}
output "node_subnet_id" {
  value = azurerm_subnet.nodes.id
}
output "postgres_subnet_id" {
  value = azurerm_subnet.postgresql.id
}
output "loadbalancer_subnet_id" {
  value = azurerm_subnet.loadbalancer.id
}