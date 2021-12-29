output "aks_id" {
  value = module.aks-acr.aks_id
}

output "aks_fqdn" {
  value = module.aks-acr.aks_fqdn
}

output "aks_node_rg" {
  value = module.aks-acr.aks_node_rg
}

output "acr_id" {
  value = module.aks-acr.acr_id
}

output "acr_login_server" {
  value = module.aks-acr.acr_login_server
}