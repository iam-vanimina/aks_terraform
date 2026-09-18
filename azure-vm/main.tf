data "azurerm_resource_group" "roboshop_rg" {
  name = "roboshop-rg"
}

data "azurerm_virtual_network" "vnet" {
  name                = "roboshop-vnet"
  resource_group_name = data.azurerm_resource_group.roboshop_rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "roboshop-subnet"
  resource_group_name  = data.azurerm_resource_group.roboshop_rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.5.0/24"]
}

module "network_security_group" {
  source = "./../modules/network-security-group"

  nsg_name            = "tf-roboshop-nsg"
  location            = data.azurerm_resource_group.roboshop_rg.location
  resource_group_name = data.azurerm_resource_group.roboshop_rg.name

  ssh_source = "*"
}

module "vm" {
  source = "./../modules/vm"

  vm_name = "tf-roboshop-vm"
  vm_size = "Standard_B2ats_v2"

  location            = data.azurerm_resource_group.roboshop_rg.location
  resource_group_name = data.azurerm_resource_group.roboshop_rg.name

  subnet_id = azurerm_subnet.subnet.id
  nsg_id    = module.network_security_group.nsg_id

  admin_username = var.admin_username
  admin_password = var.admin_password
}