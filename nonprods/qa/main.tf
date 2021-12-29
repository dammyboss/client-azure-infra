# Create a resource group
resource "azurerm_resource_group" "rg" {
  name                = "${var.env}-rg"
  location            = var.location
}
module "aks-acr" {
  source              = "../../modules/aks-acr"
  env                 = var.env
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  kubernetes_version  = var.kubernetes_version
  node_subnet_id      = module.spokevnet.node_subnet_id
  system_node_count   = var.system_node_count
}
module "hubvnet" {
  source              = "../../modules/hubvnet"
  location            = var.location
  env                 = var.env
  resource_group_name = azurerm_resource_group.rg.name
}
module "spokevnet" {
  source              = "../../modules/spokevnet"
  location            = var.location
  env                 = var.env
  resource_group_name = azurerm_resource_group.rg.name
}
module "peering" {
  source                     = "../../modules/peering"
  location                   = var.location
  env                        =var.env
  resource_group_name        = azurerm_resource_group.rg.name
  hub_virtual_network_name   = module.hubvnet.hub_virtual_network_name
  hubvnet_id                 = module.hubvnet.hubvnet_id
  spoke_virtual_network_name = module.spokevnet.spoke_virtual_network_name
  spokevnet_id               = module.spokevnet.spokevnet_id
}
module "bastion" {
  source              = "../../modules/bastion"
  location            = var.location
  env                 =var.env
  resource_group_name = azurerm_resource_group.rg.name
  bastion_subnet_id   = module.hubvnet.bastion_subnet_id
}
module "firewall" {
  source              = "../../modules/firewall"
  env                 = var.env
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  firewall_subnet_id  = module.hubvnet.firewall_subnet_id
}
module "frontdoor" {
  source              = "../../modules/frontdoor"
  location            = var.location
  env                 = var.env
  resource_group_name = azurerm_resource_group.rg.name
}
module "keyvault" {
  source              = "../../modules/keyvault"
  env                 = var.env
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  secret_name         = var.secret_name
  secret_value        = var.secret_value
}
module "postgresql" {
  source              = "../../modules/postgresql"
  location            = var.location
  env = var.env
  resource_group_name = azurerm_resource_group.rg.name
  adminname           = var.adminname
  adminpwd            = var.adminpwd
  firewall_rules      = var.firewall_rules
  postgres_subnet_id  = module.spokevnet.postgres_subnet_id
}
module "loadbalancer" {
  source              = "../../modules/loadbalancer"
  location            = var.location
  env = var.env
  resource_group_name = azurerm_resource_group.rg.name
  loadbalancer_subnet_id = module.spokevnet.loadbalancer_subnet_id
}

module "azure_cdn" {
  source                 = "../../modules/cdn"
  location = var.location
  env = var.env
  resource_group_name = azurerm_resource_group.rg.name
}