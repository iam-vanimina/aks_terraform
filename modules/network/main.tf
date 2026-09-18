resource "azurerm_virtual_network" "roboshop_vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name

  address_space = [var.vnet_address_space]
}

# -------------------------
# AKS Subnet
# -------------------------

resource "azurerm_subnet" "roboshop_aks" {
  name                 = var.aks_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.roboshop_vnet.name

  address_prefixes = [var.aks_subnet_cidr]
}

# -------------------------
# Application Gateway Subnet
# -------------------------

resource "azurerm_subnet" "roboshop_appgw" {
  name                 = var.appgw_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.roboshop_vnet.name

  address_prefixes = [var.appgw_subnet_cidr]
}

# -------------------------
# Database Subnet
# -------------------------

resource "azurerm_subnet" "roboshop_database" {
  name                 = var.database_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.roboshop_vnet.name

  address_prefixes = [var.database_subnet_cidr]

  delegation {
    name = "database-delegation"

    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"

      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action"
      ]
    }
  }
}
