output "resource_group_name" {
  value = data.azurerm_resource_group.roboshop_rg.name
}

output "vnet_id" {
  value = data.azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "vm_public_ip" {
  value = module.vm.public_ip
}

output "vm_private_ip" {
  value = module.vm.private_ip
}

output "ssh_command" {
  value = "ssh ${module.vm.admin_username}@${module.vm.public_ip}"
}

