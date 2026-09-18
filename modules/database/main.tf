resource "azurerm_private_dns_zone" "this" {
  name                = "${var.name}.private.mysql.database.azure.com"
  resource_group_name = var.resource_group_name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = "${var.name}-vnet-link"
  private_dns_zone_name = azurerm_private_dns_zone.this.name
  virtual_network_id    = var.vnet_id
  resource_group_name   = var.resource_group_name

  tags = var.tags
}

resource "azurerm_mysql_flexible_server" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  sku_name = var.sku_name

  version = "8.0.21"

  storage {
    size_gb = var.storage_size_gb
  }

  backup_retention_days = 7

  delegated_subnet_id = var.subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.this.id

  #zone = "1"

  tags = var.tags

  depends_on = [
    azurerm_private_dns_zone_virtual_network_link.this
  ]
}

resource "azurerm_mysql_flexible_database" "roboshop" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name

  charset   = "utf8mb4"
  collation = "utf8mb4_unicode_ci"
}