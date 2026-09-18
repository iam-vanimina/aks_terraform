module "resource_group" {
  source = "./../modules/resource-group"

  name     = "roboshop-rg"
  location = "southindia"
}


module "network" {
  source = "./../modules/network"

  vnet_name          = "roboshop-vnet"
  vnet_address_space = var.vnet_address_space

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  aks_subnet_cidr   = var.aks_subnet_cidr
  appgw_subnet_cidr = var.appgw_subnet_cidr
 database_subnet_cidr = var.database_subnet_cidr

}

resource "azurerm_public_ip" "nat" {
  name                = "aks-nat-public-ip"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_nat_gateway" "aks" {
  name                = "aks-nat-gateway"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location

  sku_name = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "aks" {
  nat_gateway_id       = azurerm_nat_gateway.aks.id
  public_ip_address_id = azurerm_public_ip.nat.id
}

resource "azurerm_subnet_nat_gateway_association" "aks" {
  subnet_id      = module.network.aks_subnet_id
  nat_gateway_id = azurerm_nat_gateway.aks.id
}

module "aks" {
  source = "./../modules/aks"

  cluster_name = "roboshop-aks"
  dns_prefix   = "roboshop-aks"

  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  aks_subnet_id = module.network.aks_subnet_id
  

  node_vm_size = "Standard_D2s_v5"
  node_count   = 2
}


module "application_gateway" {
  source = "./../modules/application_gateway"

  name                = "roboshop-appgw"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name

  subnet_id = module.network.appgw_subnet_id
}


# module "database" {
#   source = "./../modules/database"

#   name                = "roboshop-mysql-server"
#   location            = module.resource_group.location
#   resource_group_name = module.resource_group.name

#   subnet_id = module.network.database_subnet_id
#   vnet_id   = module.network.vnet_id

#   admin_username = var.mysql_admin_username
#   admin_password = var.mysql_admin_password

#   database_name = "roboshop"
# }