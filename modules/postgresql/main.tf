#Create postgre server
resource "azurerm_postgresql_server" "postgres-svr" {
  name                         = "${var.env}-postgres-svr"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  sku_name                     = "GP_Gen5_2"
  administrator_login          = var.adminname
  administrator_login_password = var.adminpwd
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "poc-postgres-db" {
  name                = "${var.env}-postgres-db"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgres-svr.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_firewall_rule" "pgsql-fw-rule" {
  count               = length(var.firewall_rules)
  name                = "${var.env}-pgsql-fw-rule"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgres-svr.name
  start_ip_address    = "1.2.3.4"
  end_ip_address      = "5.6.7.8"
}

resource "azurerm_postgresql_virtual_network_rule" "postgresql-vnet-rule" {
  name                                 = "${var.env}-postgresql-vnet-rule"
  resource_group_name                  = var.resource_group_name
  server_name                          = azurerm_postgresql_server.postgres-svr.name
  subnet_id                            = var.postgres_subnet_id
  ignore_missing_vnet_service_endpoint = true
}
