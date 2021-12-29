#create azure firewall
resource "azurerm_public_ip" "azfirewallpip" {
  name                = "${var.env}-azfirewallpip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "azfirewall" {
  name                = "${var.env}-azfirewall"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "${var.env}-configuration"
    subnet_id            = var.firewall_subnet_id
    public_ip_address_id = azurerm_public_ip.azfirewallpip.id
  }
}
resource "azurerm_firewall_application_rule_collection" "azfirewall-apprules" {
  name                = "${var.env}-app-allow-rule-websites"
  azure_firewall_name = azurerm_firewall.azfirewall.name
  resource_group_name = var.resource_group_name
  priority            = 200
  action              = "Allow"

  rule {
    name = "${var.env}allow-microsoft"

    source_addresses = [
      "10.0.2.0/24",
      "10.1.1.0/24",
    ]

    target_fqdns = [
      "*.microsoft.com",
      "*.azure.com",
      "*.windows.net",
    ]
    protocol {
      port = "443"
      type = "Https"
    }
    protocol {
      port = "80"
      type = "Http"
    }
  }
}
resource "azurerm_firewall_network_rule_collection" "azfirewall-netrules" {
  name                = "${var.env}-collection"
  azure_firewall_name = azurerm_firewall.azfirewall.name
  resource_group_name = var.resource_group_name
  priority            = 200
  action              = "Allow"

  rule {
    name = "${var.env}-net-allow-rule-dns"

    source_addresses = [
      "10.0.0.0/16",
      "10.1.0.0/16",
    ]

    destination_ports = [
      "53",
    ]

    destination_addresses = [
      "168.63.129.16",
    ]

    protocols = [
      "TCP",
      "UDP",
    ]
  }
}

resource "azurerm_firewall_nat_rule_collection" "fd2fwnat" {
  name                = "${var.env}-collection"
  azure_firewall_name = azurerm_firewall.azfirewall.name
  resource_group_name = var.resource_group_name
  priority            = 200
  action              = "Dnat"

  rule {
    name = "fw2lbnat"
    source_addresses = [
      "*",
    ]
    destination_ports = [
      "80",
    ]
    destination_addresses = [
      azurerm_public_ip.azfirewallpip.ip_address,
    ]
    protocols = [
      "TCP"
    ]
    translated_address = "10.1.1.100"
    translated_port    = "80"
  }
}
