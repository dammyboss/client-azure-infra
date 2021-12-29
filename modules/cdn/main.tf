resource "azurerm_storage_account" "cdn-storage" {
  name                     = "${var.env}storage00012"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_cdn_profile" "cdn-profile" {
  name                    = "${var.env}-cdn"
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku                     = "Standard_Verizon"
}

//resource "azurerm_cdn_endpoint" "poctest-cdn-endpoint" {
//  name                    = "${var.env}-cdn"
//  profile_name            = azurerm_cdn_profile.cdn-profile.name
//  location                = var.location
//  resource_group_name     = var.resource_group_name
//
//  origin {
//    name = "${var.env}origin1"
//    host_name = "www.contoso.com"
//    http_port = 80
//    https_port = 443
//  }
//}