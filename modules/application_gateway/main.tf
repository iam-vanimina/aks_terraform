resource "azurerm_public_ip" "this" {
  name                = "${var.name}-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_web_application_firewall_policy" "this" {
  name                = "${var.name}-waf-policy"
  resource_group_name = var.resource_group_name
  location            = var.location

  policy_settings {
    enabled                     = true
    mode                        = "Prevention"
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }

  managed_rules {
    managed_rule_set {
      type    = "OWASP"
      version = "3.2"
    }
  }

  tags = var.tags
}

resource "azurerm_application_gateway" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  

  sku {
    name = "WAF_v2"
    tier = "WAF_v2"
  }

  firewall_policy_id = azurerm_web_application_firewall_policy.this.id

  autoscale_configuration {
    min_capacity = 1
    max_capacity = 2
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "http-port"

    port = 80
  }

  frontend_ip_configuration {
    name                 = "public-frontend"
    public_ip_address_id = azurerm_public_ip.this.id
  }

  backend_address_pool {
    name = "roboshop-backend"
  }

  backend_http_settings {
    name                  = "roboshop-http-settings"
    cookie_based_affinity = "Disabled"

    port     = 80
    protocol = "Http"

    request_timeout = 30
  }

  http_listener {
    name                           = "roboshop-http-listener"
    frontend_ip_configuration_name = "public-frontend"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "roboshop-routing"
    priority                   = 100
    rule_type                  = "Basic"
    http_listener_name         = "roboshop-http-listener"
    backend_address_pool_name  = "roboshop-backend"
    backend_http_settings_name = "roboshop-http-settings"
  }

  tags = var.tags
}