output "resource_group_name" {
  value = module.resource_group.name
}

output "vnet_id" {
  value = module.network.vnet_id
}

output "aks_cluster_name" {
  value = module.aks.cluster_name
}

output "aks_oidc_issuer_url" {
  value = module.aks.oidc_issuer_url
}

output "application_gateway_public_ip" {
  value = module.application_gateway.public_ip_address
}

# output "mysql_server_fqdn" {
#   value = module.database.fqdn
# }

# output "mysql_database" {
#   value = module.database.database_name
# }