output "vnet_id" {
  value = azurerm_virtual_network.roboshop_vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.roboshop_vnet.name
}

output "aks_subnet_id" {
  value = azurerm_subnet.roboshop_aks.id
}

output "aks_subnet_name" {
  value = azurerm_subnet.roboshop_aks.name
}

output "appgw_subnet_id" {
  value = azurerm_subnet.roboshop_appgw.id
}

output "database_subnet_id" {
  value = azurerm_subnet.roboshop_database.id
}

output "database_subnet_name" {
  value = azurerm_subnet.roboshop_database.name
}