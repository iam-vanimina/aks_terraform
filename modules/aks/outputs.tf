output "cluster_id" {
  value = azurerm_kubernetes_cluster.rooboshop_aks.id
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.rooboshop_aks.name
}

output "kubernetes_version" {
  value = azurerm_kubernetes_cluster.rooboshop_aks.kubernetes_version
}

output "node_resource_group" {
  value = azurerm_kubernetes_cluster.rooboshop_aks.node_resource_group
}

output "kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.rooboshop_aks.kubelet_identity[0].object_id
}

output "oidc_issuer_url" {
  value = azurerm_kubernetes_cluster.rooboshop_aks.oidc_issuer_url
}