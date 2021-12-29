#create azure front door

resource "azurerm_frontdoor" "frontdoor" {
  name                                         = "${var.env}-frontdoor005"
  resource_group_name                          = var.resource_group_name
  enforce_backend_pools_certificate_name_check = false

  routing_rule {
    name               = "${var.env}RoutingRule1"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["${var.env}FrontendEndpoint1"]

    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "${var.env}-backend"
    }
  }

  backend_pool_load_balancing {
    name = "${var.env}LoadBalancingSettings1"
  }

  backend_pool_health_probe {
    name = "${var.env}HealthProbeSetting1"
  }

  backend_pool {
    name = "${var.env}-backend"
    backend {
      host_header = "www.bing.com"
      address     = "www.bing.com"
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = "${var.env}LoadBalancingSettings1"
    health_probe_name   = "${var.env}HealthProbeSetting1"
  }

  frontend_endpoint {
    name      = "${var.env}FrontendEndpoint1"
    host_name = "${var.env}-frontdoor005.azurefd.net"
  }
}