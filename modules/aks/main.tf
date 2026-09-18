resource "azurerm_kubernetes_cluster" "rooboshop_aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = var.dns_prefix

  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name                        = "system"
    vm_size                     = var.node_vm_size
    node_count                  = var.node_count
    vnet_subnet_id              = var.aks_subnet_id
    only_critical_addons_enabled = true

    type = "VirtualMachineScaleSets"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_plugin_mode = "overlay"
    network_policy    = "azure"

    load_balancer_sku = "standard"

    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip

    pod_cidr = "10.244.0.0/16"
  }

  role_based_access_control_enabled = true

  tags = var.tags
}