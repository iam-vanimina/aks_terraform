```
venka@Think-VVRAM MINGW64 ~
$ cd /c/AZURE/roboshop/

venka@Think-VVRAM MINGW64 /c/AZURE/roboshop
$ ls
CD/  CI/  monitoring/

venka@Think-VVRAM MINGW64 /c/AZURE/roboshop
$ cd ../

venka@Think-VVRAM MINGW64 /c/AZURE
$ ls
azure-terraform-infra/  kubernetes-ai-sre-agent/  roboshop/

venka@Think-VVRAM MINGW64 /c/AZURE
$ cd azure-terraform-infra/

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra
$ terraform init
Terraform initialized in an empty directory!

The directory has no Terraform configuration files. You may begin working
with Terraform immediately by creating Terraform configuration files.

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra
$ terraform plan
╷
│ Error: No configuration files
│
│ Plan requires configuration to be present. Planning without a configuration would mark everything for destruction, which is normally not what is desired. If you would
│ like to destroy everything, run plan with the -destroy option. Otherwise, create a Terraform configuration file (.tf file) and try again.
╵

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra
$ terraform init
Terraform initialized in an empty directory!

The directory has no Terraform configuration files. You may begin working
with Terraform immediately by creating Terraform configuration files.

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra
$ ls
-  Readme.md  Readme1.md  aks/  azure-vm/  bak/  modules/

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra
$ cd aks/

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ ls
main.tf  outputs.tf  provider.tf  terraform.tfvars  terraformout.md  terraformout.txt  variables.tf

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform init
Initializing the backend...
Initializing modules...
Initializing provider plugins...
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Using previously-installed hashicorp/azurerm v4.81.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.aks.azurerm_kubernetes_cluster.rooboshop_aks will be created
  + resource "azurerm_kubernetes_cluster" "rooboshop_aks" {
      + ai_toolchain_operator_enabled       = false
      + current_kubernetes_version          = (known after apply)
      + dns_prefix                          = "roboshop-aks"
      + fqdn                                = (known after apply)
      + http_application_routing_zone_name  = (known after apply)
      + id                                  = (known after apply)
      + kube_admin_config                   = (sensitive value)
      + kube_admin_config_raw               = (sensitive value)
      + kube_config                         = (sensitive value)
      + kube_config_raw                     = (sensitive value)
      + kubernetes_version                  = (known after apply)
      + location                            = "southindia"
      + name                                = "roboshop-aks"
      + node_os_upgrade_channel             = "NodeImage"
      + node_resource_group                 = (known after apply)
      + node_resource_group_id              = (known after apply)
      + oidc_issuer_enabled                 = (known after apply)
      + oidc_issuer_url                     = (known after apply)
      + portal_fqdn                         = (known after apply)
      + private_cluster_enabled             = false
      + private_cluster_public_fqdn_enabled = false
      + private_dns_zone_id                 = (known after apply)
      + private_fqdn                        = (known after apply)
      + resource_group_name                 = "roboshop-rg"
      + role_based_access_control_enabled   = true
      + run_command_enabled                 = true
      + sku_tier                            = "Free"
      + support_plan                        = "KubernetesOfficial"
      + tags                                = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + workload_identity_enabled           = false

      + auto_scaler_profile (known after apply)

      + bootstrap_profile (known after apply)

      + default_node_pool {
          + kubelet_disk_type            = (known after apply)
          + max_pods                     = (known after apply)
          + name                         = "system"
          + node_count                   = 2
          + node_labels                  = (known after apply)
          + only_critical_addons_enabled = true
          + orchestrator_version         = (known after apply)
          + os_disk_size_gb              = (known after apply)
          + os_disk_type                 = "Managed"
          + os_sku                       = (known after apply)
          + scale_down_mode              = "Delete"
          + type                         = "VirtualMachineScaleSets"
          + ultra_ssd_enabled            = false
          + vm_size                      = "Standard_D2s_v5"
          + vnet_subnet_id               = (known after apply)
          + workload_runtime             = (known after apply)
        }

      + identity {
          + principal_id = (known after apply)
          + tenant_id    = (known after apply)
          + type         = "SystemAssigned"
        }

      + kubelet_identity (known after apply)

      + network_profile {
          + dns_service_ip      = "10.10.0.10"
          + ip_versions         = (known after apply)
          + load_balancer_sku   = "standard"
          + network_data_plane  = "azure"
          + network_mode        = (known after apply)
          + network_plugin      = "azure"
          + network_plugin_mode = "overlay"
          + network_policy      = "azure"
          + outbound_type       = "loadBalancer"
          + pod_cidr            = "10.244.0.0/16"
          + pod_cidrs           = (known after apply)
          + service_cidr        = "10.10.0.0/16"
          + service_cidrs       = (known after apply)

          + load_balancer_profile (known after apply)

          + nat_gateway_profile (known after apply)
        }

      + node_provisioning_profile (known after apply)

      + windows_profile (known after apply)
    }

  # module.application_gateway.azurerm_application_gateway.this will be created
  + resource "azurerm_application_gateway" "this" {
      + enable_http2                = (known after apply)
      + http2_enabled               = (known after apply)
      + id                          = (known after apply)
      + location                    = "southindia"
      + name                        = "roboshop-appgw"
      + private_endpoint_connection = (known after apply)
      + resource_group_name         = "roboshop-rg"
      + tags                        = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }

      + autoscale_configuration {
          + max_capacity = 2
          + min_capacity = 1
        }

      + backend_address_pool {
          + fqdns        = []
          + id           = (known after apply)
          + ip_addresses = []
          + name         = "roboshop-backend"
        }

      + backend_http_settings {
          + certificate_chain_validation_enabled = true
          + cookie_based_affinity                = "Disabled"
          + dedicated_backend_connection_enabled = false
          + id                                   = (known after apply)
          + name                                 = "roboshop-http-settings"
          + pick_host_name_from_backend_address  = false
          + port                                 = 80
          + probe_id                             = (known after apply)
          + protocol                             = "Http"
          + request_timeout                      = 30
          + sni_validation_enabled               = true
          + trusted_root_certificate_names       = []
            # (5 unchanged attributes hidden)
        }

      + frontend_ip_configuration {
          + id                            = (known after apply)
          + name                          = "public-frontend"
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "Dynamic"
          + private_link_configuration_id = (known after apply)
          + public_ip_address_id          = (known after apply)
        }

      + frontend_port {
          + id   = (known after apply)
          + name = "http-port"
          + port = 80
        }

      + gateway_ip_configuration {
          + id        = (known after apply)
          + name      = "gateway-ip-config"
          + subnet_id = (known after apply)
        }

      + http_listener {
          + frontend_ip_configuration_id   = (known after apply)
          + frontend_ip_configuration_name = "public-frontend"
          + frontend_port_id               = (known after apply)
          + frontend_port_name             = "http-port"
          + host_names                     = []
          + id                             = (known after apply)
          + name                           = "roboshop-http-listener"
          + protocol                       = "Http"
          + ssl_certificate_id             = (known after apply)
          + ssl_profile_id                 = (known after apply)
            # (4 unchanged attributes hidden)
        }

      + request_routing_rule {
          + backend_address_pool_id     = (known after apply)
          + backend_address_pool_name   = "roboshop-backend"
          + backend_http_settings_id    = (known after apply)
          + backend_http_settings_name  = "roboshop-http-settings"
          + http_listener_id            = (known after apply)
          + http_listener_name          = "roboshop-http-listener"
          + id                          = (known after apply)
          + name                        = "roboshop-routing"
          + priority                    = 100
          + redirect_configuration_id   = (known after apply)
          + rewrite_rule_set_id         = (known after apply)
          + rule_type                   = "Basic"
          + url_path_map_id             = (known after apply)
            # (3 unchanged attributes hidden)
        }

      + sku {
          + name = "WAF_v2"
          + tier = "WAF_v2"
        }

      + ssl_policy (known after apply)
    }

  # module.application_gateway.azurerm_public_ip.this will be created
  + resource "azurerm_public_ip" "this" {
      + allocation_method       = "Static"
      + ddos_protection_mode    = "VirtualNetworkInherited"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "southindia"
      + name                    = "roboshop-appgw-public-ip"
      + resource_group_name     = "roboshop-rg"
      + sku                     = "Standard"
      + sku_tier                = "Regional"
    }

  # module.database.azurerm_mysql_flexible_database.roboshop will be created
  + resource "azurerm_mysql_flexible_database" "roboshop" {
      + charset             = "utf8mb4"
      + collation           = "utf8mb4_unicode_ci"
      + id                  = (known after apply)
      + name                = "roboshop"
      + resource_group_name = "roboshop-rg"
      + server_name         = "roboshop-mysql-server"
    }

  # module.database.azurerm_mysql_flexible_server.this will be created
  + resource "azurerm_mysql_flexible_server" "this" {
      + administrator_login           = "roboshopadmin"
      + administrator_password        = (sensitive value)
      + administrator_password_wo     = (write-only attribute)
      + backup_retention_days         = 7
      + delegated_subnet_id           = (known after apply)
      + fqdn                          = (known after apply)
      + geo_redundant_backup_enabled  = false
      + id                            = (known after apply)
      + location                      = "southindia"
      + name                          = "roboshop-mysql-server"
      + private_dns_zone_id           = (known after apply)
      + public_network_access         = (known after apply)
      + public_network_access_enabled = (known after apply)
      + replica_capacity              = (known after apply)
      + replication_role              = (known after apply)
      + resource_group_name           = "roboshop-rg"
      + sku_name                      = "B_Standard_B1ms"
      + tags                          = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + version                       = "8.0.21"
      + zone                          = "1"

      + storage {
          + auto_grow_enabled   = true
          + io_scaling_enabled  = false
          + iops                = (known after apply)
          + log_on_disk_enabled = false
          + size_gb             = 20
        }
    }

  # module.database.azurerm_private_dns_zone.this will be created
  + resource "azurerm_private_dns_zone" "this" {
      + id                                                    = (known after apply)
      + max_number_of_record_sets                             = (known after apply)
      + max_number_of_virtual_network_links                   = (known after apply)
      + max_number_of_virtual_network_links_with_registration = (known after apply)
      + name                                                  = "roboshop-mysql-server.private.mysql.database.azure.com"
      + number_of_record_sets                                 = (known after apply)
      + resource_group_name                                   = "roboshop-rg"
      + tags                                                  = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }

      + soa_record (known after apply)
    }

  # module.database.azurerm_private_dns_zone_virtual_network_link.this will be created
  + resource "azurerm_private_dns_zone_virtual_network_link" "this" {
      + id                    = (known after apply)
      + name                  = "roboshop-mysql-server-vnet-link"
      + private_dns_zone_name = "roboshop-mysql-server.private.mysql.database.azure.com"
      + registration_enabled  = false
      + resolution_policy     = (known after apply)
      + resource_group_name   = "roboshop-rg"
      + tags                  = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + virtual_network_id    = (known after apply)
    }

  # module.network.azurerm_subnet.roboshop_aks will be created
  + resource "azurerm_subnet" "roboshop_aks" {
      + address_prefixes                              = [
          + "10.0.1.0/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "aks-subnet"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "roboshop-rg"
      + virtual_network_name                          = "roboshop-vnet"
    }

  # module.network.azurerm_subnet.roboshop_appgw will be created
  + resource "azurerm_subnet" "roboshop_appgw" {
      + address_prefixes                              = [
          + "10.0.2.0/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "appgw-subnet"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "roboshop-rg"
      + virtual_network_name                          = "roboshop-vnet"
    }

  # module.network.azurerm_subnet.roboshop_database will be created
  + resource "azurerm_subnet" "roboshop_database" {
      + address_prefixes                              = [
          + "10.0.3.0/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "database-subnet"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "roboshop-rg"
      + virtual_network_name                          = "roboshop-vnet"

      + delegation {
          + name = "database-delegation"

          + service_delegation {
              + actions = [
                  + "Microsoft.Network/virtualNetworks/subnets/join/action",
                ]
              + name    = "Microsoft.DBforMySQL/flexibleServers"
            }
        }
    }

  # module.network.azurerm_virtual_network.roboshop_vnet will be created
  + resource "azurerm_virtual_network" "roboshop_vnet" {
      + address_space                  = [
          + "10.0.0.0/16",
        ]
      + dns_servers                    = (known after apply)
      + guid                           = (known after apply)
      + id                             = (known after apply)
      + location                       = "southindia"
      + name                           = "roboshop-vnet"
      + private_endpoint_vnet_policies = "Disabled"
      + resource_group_name            = "roboshop-rg"
      + subnet                         = (known after apply)
    }

  # module.resource_group.azurerm_resource_group.this will be created
  + resource "azurerm_resource_group" "this" {
      + id       = (known after apply)
      + location = "southindia"
      + name     = "roboshop-rg"
    }

Plan: 12 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + aks_cluster_name              = "roboshop-aks"
  + aks_oidc_issuer_url           = (known after apply)
  + application_gateway_public_ip = (known after apply)
  + mysql_database                = "roboshop"
  + mysql_server_fqdn             = (known after apply)
  + resource_group_name           = "roboshop-rg"
  + vnet_id                       = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.aks.azurerm_kubernetes_cluster.rooboshop_aks will be created
  + resource "azurerm_kubernetes_cluster" "rooboshop_aks" {
      + ai_toolchain_operator_enabled       = false
      + current_kubernetes_version          = (known after apply)
      + dns_prefix                          = "roboshop-aks"
      + fqdn                                = (known after apply)
      + http_application_routing_zone_name  = (known after apply)
      + id                                  = (known after apply)
      + kube_admin_config                   = (sensitive value)
      + kube_admin_config_raw               = (sensitive value)
      + kube_config                         = (sensitive value)
      + kube_config_raw                     = (sensitive value)
      + kubernetes_version                  = (known after apply)
      + location                            = "southindia"
      + name                                = "roboshop-aks"
      + node_os_upgrade_channel             = "NodeImage"
      + node_resource_group                 = (known after apply)
      + node_resource_group_id              = (known after apply)
      + oidc_issuer_enabled                 = (known after apply)
      + oidc_issuer_url                     = (known after apply)
      + portal_fqdn                         = (known after apply)
      + private_cluster_enabled             = false
      + private_cluster_public_fqdn_enabled = false
      + private_dns_zone_id                 = (known after apply)
      + private_fqdn                        = (known after apply)
      + resource_group_name                 = "roboshop-rg"
      + role_based_access_control_enabled   = true
      + run_command_enabled                 = true
      + sku_tier                            = "Free"
      + support_plan                        = "KubernetesOfficial"
      + tags                                = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + workload_identity_enabled           = false

      + auto_scaler_profile (known after apply)

      + bootstrap_profile (known after apply)

      + default_node_pool {
          + kubelet_disk_type            = (known after apply)
          + max_pods                     = (known after apply)
          + name                         = "system"
          + node_count                   = 2
          + node_labels                  = (known after apply)
          + only_critical_addons_enabled = true
          + orchestrator_version         = (known after apply)
          + os_disk_size_gb              = (known after apply)
          + os_disk_type                 = "Managed"
          + os_sku                       = (known after apply)
          + scale_down_mode              = "Delete"
          + type                         = "VirtualMachineScaleSets"
          + ultra_ssd_enabled            = false
          + vm_size                      = "Standard_D2s_v5"
          + vnet_subnet_id               = (known after apply)
          + workload_runtime             = (known after apply)
        }

      + identity {
          + principal_id = (known after apply)
          + tenant_id    = (known after apply)
          + type         = "SystemAssigned"
        }

      + kubelet_identity (known after apply)

      + network_profile {
          + dns_service_ip      = "10.10.0.10"
          + ip_versions         = (known after apply)
          + load_balancer_sku   = "standard"
          + network_data_plane  = "azure"
          + network_mode        = (known after apply)
          + network_plugin      = "azure"
          + network_plugin_mode = "overlay"
          + network_policy      = "azure"
          + outbound_type       = "loadBalancer"
          + pod_cidr            = "10.244.0.0/16"
          + pod_cidrs           = (known after apply)
          + service_cidr        = "10.10.0.0/16"
          + service_cidrs       = (known after apply)

          + load_balancer_profile (known after apply)

          + nat_gateway_profile (known after apply)
        }

      + node_provisioning_profile (known after apply)

      + windows_profile (known after apply)
    }

  # module.application_gateway.azurerm_application_gateway.this will be created
  + resource "azurerm_application_gateway" "this" {
      + enable_http2                = (known after apply)
      + http2_enabled               = (known after apply)
      + id                          = (known after apply)
      + location                    = "southindia"
      + name                        = "roboshop-appgw"
      + private_endpoint_connection = (known after apply)
      + resource_group_name         = "roboshop-rg"
      + tags                        = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }

      + autoscale_configuration {
          + max_capacity = 2
          + min_capacity = 1
        }

      + backend_address_pool {
          + fqdns        = []
          + id           = (known after apply)
          + ip_addresses = []
          + name         = "roboshop-backend"
        }

      + backend_http_settings {
          + certificate_chain_validation_enabled = true
          + cookie_based_affinity                = "Disabled"
          + dedicated_backend_connection_enabled = false
          + id                                   = (known after apply)
          + name                                 = "roboshop-http-settings"
          + pick_host_name_from_backend_address  = false
          + port                                 = 80
          + probe_id                             = (known after apply)
          + protocol                             = "Http"
          + request_timeout                      = 30
          + sni_validation_enabled               = true
          + trusted_root_certificate_names       = []
            # (5 unchanged attributes hidden)
        }

      + frontend_ip_configuration {
          + id                            = (known after apply)
          + name                          = "public-frontend"
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "Dynamic"
          + private_link_configuration_id = (known after apply)
          + public_ip_address_id          = (known after apply)
        }

      + frontend_port {
          + id   = (known after apply)
          + name = "http-port"
          + port = 80
        }

      + gateway_ip_configuration {
          + id        = (known after apply)
          + name      = "gateway-ip-config"
          + subnet_id = (known after apply)
        }

      + http_listener {
          + frontend_ip_configuration_id   = (known after apply)
          + frontend_ip_configuration_name = "public-frontend"
          + frontend_port_id               = (known after apply)
          + frontend_port_name             = "http-port"
          + host_names                     = []
          + id                             = (known after apply)
          + name                           = "roboshop-http-listener"
          + protocol                       = "Http"
          + ssl_certificate_id             = (known after apply)
          + ssl_profile_id                 = (known after apply)
            # (4 unchanged attributes hidden)
        }

      + request_routing_rule {
          + backend_address_pool_id     = (known after apply)
          + backend_address_pool_name   = "roboshop-backend"
          + backend_http_settings_id    = (known after apply)
          + backend_http_settings_name  = "roboshop-http-settings"
          + http_listener_id            = (known after apply)
          + http_listener_name          = "roboshop-http-listener"
          + id                          = (known after apply)
          + name                        = "roboshop-routing"
          + priority                    = 100
          + redirect_configuration_id   = (known after apply)
          + rewrite_rule_set_id         = (known after apply)
          + rule_type                   = "Basic"
          + url_path_map_id             = (known after apply)
            # (3 unchanged attributes hidden)
        }

      + sku {
          + name = "WAF_v2"
          + tier = "WAF_v2"
        }

      + ssl_policy (known after apply)
    }

  # module.application_gateway.azurerm_public_ip.this will be created
  + resource "azurerm_public_ip" "this" {
      + allocation_method       = "Static"
      + ddos_protection_mode    = "VirtualNetworkInherited"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "southindia"
      + name                    = "roboshop-appgw-public-ip"
      + resource_group_name     = "roboshop-rg"
      + sku                     = "Standard"
      + sku_tier                = "Regional"
    }

  # module.database.azurerm_mysql_flexible_database.roboshop will be created
  + resource "azurerm_mysql_flexible_database" "roboshop" {
      + charset             = "utf8mb4"
      + collation           = "utf8mb4_unicode_ci"
      + id                  = (known after apply)
      + name                = "roboshop"
      + resource_group_name = "roboshop-rg"
      + server_name         = "roboshop-mysql-server"
    }

  # module.database.azurerm_mysql_flexible_server.this will be created
  + resource "azurerm_mysql_flexible_server" "this" {
      + administrator_login           = "roboshopadmin"
      + administrator_password        = (sensitive value)
      + administrator_password_wo     = (write-only attribute)
      + backup_retention_days         = 7
      + delegated_subnet_id           = (known after apply)
      + fqdn                          = (known after apply)
      + geo_redundant_backup_enabled  = false
      + id                            = (known after apply)
      + location                      = "southindia"
      + name                          = "roboshop-mysql-server"
      + private_dns_zone_id           = (known after apply)
      + public_network_access         = (known after apply)
      + public_network_access_enabled = (known after apply)
      + replica_capacity              = (known after apply)
      + replication_role              = (known after apply)
      + resource_group_name           = "roboshop-rg"
      + sku_name                      = "B_Standard_B1ms"
      + tags                          = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + version                       = "8.0.21"
      + zone                          = "1"

      + storage {
          + auto_grow_enabled   = true
          + io_scaling_enabled  = false
          + iops                = (known after apply)
          + log_on_disk_enabled = false
          + size_gb             = 20
        }
    }

  # module.database.azurerm_private_dns_zone.this will be created
  + resource "azurerm_private_dns_zone" "this" {
      + id                                                    = (known after apply)
      + max_number_of_record_sets                             = (known after apply)
      + max_number_of_virtual_network_links                   = (known after apply)
      + max_number_of_virtual_network_links_with_registration = (known after apply)
      + name                                                  = "roboshop-mysql-server.private.mysql.database.azure.com"
      + number_of_record_sets                                 = (known after apply)
      + resource_group_name                                   = "roboshop-rg"
      + tags                                                  = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }

      + soa_record (known after apply)
    }

  # module.database.azurerm_private_dns_zone_virtual_network_link.this will be created
  + resource "azurerm_private_dns_zone_virtual_network_link" "this" {
      + id                    = (known after apply)
      + name                  = "roboshop-mysql-server-vnet-link"
      + private_dns_zone_name = "roboshop-mysql-server.private.mysql.database.azure.com"
      + registration_enabled  = false
      + resolution_policy     = (known after apply)
      + resource_group_name   = "roboshop-rg"
      + tags                  = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + virtual_network_id    = (known after apply)
    }

  # module.network.azurerm_subnet.roboshop_aks will be created
  + resource "azurerm_subnet" "roboshop_aks" {
      + address_prefixes                              = [
          + "10.0.1.0/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "aks-subnet"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "roboshop-rg"
      + virtual_network_name                          = "roboshop-vnet"
    }

  # module.network.azurerm_subnet.roboshop_appgw will be created
  + resource "azurerm_subnet" "roboshop_appgw" {
      + address_prefixes                              = [
          + "10.0.2.0/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "appgw-subnet"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "roboshop-rg"
      + virtual_network_name                          = "roboshop-vnet"
    }

  # module.network.azurerm_subnet.roboshop_database will be created
  + resource "azurerm_subnet" "roboshop_database" {
      + address_prefixes                              = [
          + "10.0.3.0/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "database-subnet"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "roboshop-rg"
      + virtual_network_name                          = "roboshop-vnet"

      + delegation {
          + name = "database-delegation"

          + service_delegation {
              + actions = [
                  + "Microsoft.Network/virtualNetworks/subnets/join/action",
                ]
              + name    = "Microsoft.DBforMySQL/flexibleServers"
            }
        }
    }

  # module.network.azurerm_virtual_network.roboshop_vnet will be created
  + resource "azurerm_virtual_network" "roboshop_vnet" {
      + address_space                  = [
          + "10.0.0.0/16",
        ]
      + dns_servers                    = (known after apply)
      + guid                           = (known after apply)
      + id                             = (known after apply)
      + location                       = "southindia"
      + name                           = "roboshop-vnet"
      + private_endpoint_vnet_policies = "Disabled"
      + resource_group_name            = "roboshop-rg"
      + subnet                         = (known after apply)
    }

  # module.resource_group.azurerm_resource_group.this will be created
  + resource "azurerm_resource_group" "this" {
      + id       = (known after apply)
      + location = "southindia"
      + name     = "roboshop-rg"
    }

Plan: 12 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + aks_cluster_name              = "roboshop-aks"
  + aks_oidc_issuer_url           = (known after apply)
  + application_gateway_public_ip = (known after apply)
  + mysql_database                = "roboshop"
  + mysql_server_fqdn             = (known after apply)
  + resource_group_name           = "roboshop-rg"
  + vnet_id                       = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.resource_group.azurerm_resource_group.this: Creating...
module.resource_group.azurerm_resource_group.this: Still creating... [10s elapsed]
module.resource_group.azurerm_resource_group.this: Still creating... [20s elapsed]
module.resource_group.azurerm_resource_group.this: Creation complete after 25s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg]
module.network.azurerm_virtual_network.roboshop_vnet: Creating...
module.application_gateway.azurerm_public_ip.this: Creating...
module.database.azurerm_private_dns_zone.this: Creating...
module.application_gateway.azurerm_public_ip.this: Creation complete after 3s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/publicIPAddresses/roboshop-appgw-public-ip]
module.network.azurerm_virtual_network.roboshop_vnet: Creation complete after 7s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet]
module.network.azurerm_subnet.roboshop_aks: Creating...
module.network.azurerm_subnet.roboshop_database: Creating...
module.network.azurerm_subnet.roboshop_appgw: Creating...
module.database.azurerm_private_dns_zone.this: Still creating... [10s elapsed]
module.network.azurerm_subnet.roboshop_appgw: Creation complete after 6s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/appgw-subnet]
module.application_gateway.azurerm_application_gateway.this: Creating...
module.network.azurerm_subnet.roboshop_aks: Still creating... [10s elapsed]
module.network.azurerm_subnet.roboshop_database: Still creating... [10s elapsed]
module.network.azurerm_subnet.roboshop_database: Creation complete after 12s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet]
module.database.azurerm_private_dns_zone.this: Still creating... [20s elapsed]
module.network.azurerm_subnet.roboshop_aks: Creation complete after 17s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/aks-subnet]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Creating...
module.database.azurerm_private_dns_zone.this: Still creating... [30s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [10s elapsed]
module.database.azurerm_private_dns_zone.this: Creation complete after 35s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Creating...
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [20s elapsed]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Still creating... [10s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [30s elapsed]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Still creating... [20s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [40s elapsed]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Still creating... [30s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [50s elapsed]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Still creating... [40s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [1m0s elapsed]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Still creating... [50s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [1m10s elapsed]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Still creating... [1m0s elapsed]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Creation complete after 1m5s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com/virtualNetworkLinks/roboshop-mysql-server-vnet-link]
module.database.azurerm_mysql_flexible_server.this: Creating...
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [1m20s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [10s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [1m30s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [20s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [1m40s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [30s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [1m50s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [40s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [2m0s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [50s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [2m10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [1m0s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [2m20s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [2m30s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [2m40s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [2m50s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [3m0s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [3m10s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [3m20s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [3m30s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still creating... [3m40s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Creation complete after 3m49s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]
╷
│ Error: creating Application Gateway (Subscription: "ee6ecc1b-df3d-42ff-b352-9685a8d6609c"
│ Resource Group Name: "roboshop-rg"
│ Application Gateway Name: "roboshop-appgw"): performing CreateOrUpdate: unexpected status 400 (400 Bad Request) with error: ApplicationGatewayFirewallNotConfiguredForSelectedSku: Application Gateway /subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/applicationGateways/roboshop-appgw with the selected SKU tier WAF_v2 must have a valid WAF policy or configuration
│
│   with module.application_gateway.azurerm_application_gateway.this,
│   on ..\modules\application_gateway\main.tf line 10, in resource "azurerm_application_gateway" "this":
│   10: resource "azurerm_application_gateway" "this" {
│
╵
╷
│ Error: creating Flexible Server (Subscription: "ee6ecc1b-df3d-42ff-b352-9685a8d6609c"
│ Resource Group Name: "roboshop-rg"
│ Flexible Server Name: "roboshop-mysql-server"): polling after Create: polling failed: the Azure API returned the following error:
│
│ Status: "AvailableZoneNotFound"
│ Code: ""
│ Message: "The availiabilityZone '1' is not found for subscription id 'ee6ecc1b-df3d-42ff-b352-9685a8d6609c'."
│ Activity Id: ""
│
│ ---
│
│ API Response:
│
│ ----[start]----
│ {"name":"35e0e01a-b855-42f7-ad5d-6d42368e64fe","status":"Failed","startTime":"2026-09-18T04:53:52.487Z","error":{"code":"AvailableZoneNotFound","message":"The availiabilityZone '1' is not found for subscription id 'ee6ecc1b-df3d-42ff-b352-9685a8d6609c'."}}
│ -----[end]-----
│
│
│   with module.database.azurerm_mysql_flexible_server.this,
│   on ..\modules\database\main.tf line 17, in resource "azurerm_mysql_flexible_server" "this":
│   17: resource "azurerm_mysql_flexible_server" "this" {
│
╵

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform init
Initializing the backend...
Initializing modules...
Initializing provider plugins...
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Using previously-installed hashicorp/azurerm v4.81.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform plan
module.resource_group.azurerm_resource_group.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg]
module.application_gateway.azurerm_public_ip.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/publicIPAddresses/roboshop-appgw-public-ip]
module.network.azurerm_virtual_network.roboshop_vnet: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet]
module.database.azurerm_private_dns_zone.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com]
module.network.azurerm_subnet.roboshop_appgw: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/appgw-subnet]
module.network.azurerm_subnet.roboshop_aks: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/aks-subnet]
module.network.azurerm_subnet.roboshop_database: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com/virtualNetworkLinks/roboshop-mysql-server-vnet-link]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # module.aks.azurerm_kubernetes_cluster.rooboshop_aks will be updated in-place
  ~ resource "azurerm_kubernetes_cluster" "rooboshop_aks" {
        id                                  = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks"
        name                                = "roboshop-aks"
        tags                                = {
            "environment" = "dev"
            "managed_by"  = "terraform"
            "project"     = "roboshop"
        }
        # (37 unchanged attributes hidden)

      ~ default_node_pool {
            name                          = "system"
            tags                          = {}
            # (31 unchanged attributes hidden)

          - upgrade_settings {
              - drain_timeout_in_minutes      = 0 -> null
              - max_surge                     = "10%" -> null
              - node_soak_duration_in_minutes = 0 -> null
                # (1 unchanged attribute hidden)
            }
        }

        # (6 unchanged blocks hidden)
    }

  # module.application_gateway.azurerm_application_gateway.this will be created
  + resource "azurerm_application_gateway" "this" {
      + enable_http2                = (known after apply)
      + firewall_policy_id          = (known after apply)
      + http2_enabled               = (known after apply)
      + id                          = (known after apply)
      + location                    = "southindia"
      + name                        = "roboshop-appgw"
      + private_endpoint_connection = (known after apply)
      + resource_group_name         = "roboshop-rg"
      + tags                        = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }

      + autoscale_configuration {
          + max_capacity = 2
          + min_capacity = 1
        }

      + backend_address_pool {
          + fqdns        = []
          + id           = (known after apply)
          + ip_addresses = []
          + name         = "roboshop-backend"
        }

      + backend_http_settings {
          + certificate_chain_validation_enabled = true
          + cookie_based_affinity                = "Disabled"
          + dedicated_backend_connection_enabled = false
          + id                                   = (known after apply)
          + name                                 = "roboshop-http-settings"
          + pick_host_name_from_backend_address  = false
          + port                                 = 80
          + probe_id                             = (known after apply)
          + protocol                             = "Http"
          + request_timeout                      = 30
          + sni_validation_enabled               = true
          + trusted_root_certificate_names       = []
            # (5 unchanged attributes hidden)
        }

      + frontend_ip_configuration {
          + id                            = (known after apply)
          + name                          = "public-frontend"
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "Dynamic"
          + private_link_configuration_id = (known after apply)
          + public_ip_address_id          = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/publicIPAddresses/roboshop-appgw-public-ip"
        }

      + frontend_port {
          + id   = (known after apply)
          + name = "http-port"
          + port = 80
        }

      + gateway_ip_configuration {
          + id        = (known after apply)
          + name      = "gateway-ip-config"
          + subnet_id = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/appgw-subnet"
        }

      + http_listener {
          + frontend_ip_configuration_id   = (known after apply)
          + frontend_ip_configuration_name = "public-frontend"
          + frontend_port_id               = (known after apply)
          + frontend_port_name             = "http-port"
          + host_names                     = []
          + id                             = (known after apply)
          + name                           = "roboshop-http-listener"
          + protocol                       = "Http"
          + ssl_certificate_id             = (known after apply)
          + ssl_profile_id                 = (known after apply)
            # (4 unchanged attributes hidden)
        }

      + request_routing_rule {
          + backend_address_pool_id     = (known after apply)
          + backend_address_pool_name   = "roboshop-backend"
          + backend_http_settings_id    = (known after apply)
          + backend_http_settings_name  = "roboshop-http-settings"
          + http_listener_id            = (known after apply)
          + http_listener_name          = "roboshop-http-listener"
          + id                          = (known after apply)
          + name                        = "roboshop-routing"
          + priority                    = 100
          + redirect_configuration_id   = (known after apply)
          + rewrite_rule_set_id         = (known after apply)
          + rule_type                   = "Basic"
          + url_path_map_id             = (known after apply)
            # (3 unchanged attributes hidden)
        }

      + sku {
          + name = "WAF_v2"
          + tier = "WAF_v2"
        }

      + ssl_policy (known after apply)
    }

  # module.application_gateway.azurerm_web_application_firewall_policy.this will be created
  + resource "azurerm_web_application_firewall_policy" "this" {
      + http_listener_ids   = (known after apply)
      + id                  = (known after apply)
      + location            = "southindia"
      + name                = "roboshop-appgw-waf-policy"
      + path_based_rule_ids = (known after apply)
      + resource_group_name = "roboshop-rg"
      + tags                = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }

      + managed_rules {
          + managed_rule_set {
              + type    = "OWASP"
              + version = "3.2"
            }
        }

      + policy_settings {
          + enabled                                   = true
          + file_upload_enforcement                   = (known after apply)
          + file_upload_limit_in_mb                   = 100
          + js_challenge_cookie_expiration_in_minutes = 30
          + max_request_body_size_in_kb               = 128
          + mode                                      = "Prevention"
          + request_body_check                        = true
          + request_body_enforcement                  = true
          + request_body_inspect_limit_in_kb          = 128
        }
    }

  # module.database.azurerm_mysql_flexible_database.roboshop will be created
  + resource "azurerm_mysql_flexible_database" "roboshop" {
      + charset             = "utf8mb4"
      + collation           = "utf8mb4_unicode_ci"
      + id                  = (known after apply)
      + name                = "roboshop"
      + resource_group_name = "roboshop-rg"
      + server_name         = "roboshop-mysql-server"
    }

  # module.database.azurerm_mysql_flexible_server.this will be created
  + resource "azurerm_mysql_flexible_server" "this" {
      + administrator_login           = "roboshopadmin"
      + administrator_password        = (sensitive value)
      + administrator_password_wo     = (write-only attribute)
      + backup_retention_days         = 7
      + delegated_subnet_id           = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet"
      + fqdn                          = (known after apply)
      + geo_redundant_backup_enabled  = false
      + id                            = (known after apply)
      + location                      = "southindia"
      + name                          = "roboshop-mysql-server"
      + private_dns_zone_id           = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com"
      + public_network_access         = (known after apply)
      + public_network_access_enabled = (known after apply)
      + replica_capacity              = (known after apply)
      + replication_role              = (known after apply)
      + resource_group_name           = "roboshop-rg"
      + sku_name                      = "B_Standard_B1ms"
      + tags                          = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + version                       = "8.0.21"
      + zone                          = "1"

      + storage {
          + auto_grow_enabled   = true
          + io_scaling_enabled  = false
          + iops                = (known after apply)
          + log_on_disk_enabled = false
          + size_gb             = 20
        }
    }

Plan: 4 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  + mysql_server_fqdn             = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform apply
module.resource_group.azurerm_resource_group.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg]
module.network.azurerm_virtual_network.roboshop_vnet: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet]
module.application_gateway.azurerm_public_ip.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/publicIPAddresses/roboshop-appgw-public-ip]
module.database.azurerm_private_dns_zone.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com]
module.network.azurerm_subnet.roboshop_appgw: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/appgw-subnet]
module.network.azurerm_subnet.roboshop_database: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet]
module.network.azurerm_subnet.roboshop_aks: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/aks-subnet]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com/virtualNetworkLinks/roboshop-mysql-server-vnet-link]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # module.aks.azurerm_kubernetes_cluster.rooboshop_aks will be updated in-place
  ~ resource "azurerm_kubernetes_cluster" "rooboshop_aks" {
        id                                  = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks"
        name                                = "roboshop-aks"
        tags                                = {
            "environment" = "dev"
            "managed_by"  = "terraform"
            "project"     = "roboshop"
        }
        # (37 unchanged attributes hidden)

      ~ default_node_pool {
            name                          = "system"
            tags                          = {}
            # (31 unchanged attributes hidden)

          - upgrade_settings {
              - drain_timeout_in_minutes      = 0 -> null
              - max_surge                     = "10%" -> null
              - node_soak_duration_in_minutes = 0 -> null
                # (1 unchanged attribute hidden)
            }
        }

        # (6 unchanged blocks hidden)
    }

  # module.application_gateway.azurerm_application_gateway.this will be created
  + resource "azurerm_application_gateway" "this" {
      + enable_http2                = (known after apply)
      + firewall_policy_id          = (known after apply)
      + http2_enabled               = (known after apply)
      + id                          = (known after apply)
      + location                    = "southindia"
      + name                        = "roboshop-appgw"
      + private_endpoint_connection = (known after apply)
      + resource_group_name         = "roboshop-rg"
      + tags                        = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }

      + autoscale_configuration {
          + max_capacity = 2
          + min_capacity = 1
        }

      + backend_address_pool {
          + fqdns        = []
          + id           = (known after apply)
          + ip_addresses = []
          + name         = "roboshop-backend"
        }

      + backend_http_settings {
          + certificate_chain_validation_enabled = true
          + cookie_based_affinity                = "Disabled"
          + dedicated_backend_connection_enabled = false
          + id                                   = (known after apply)
          + name                                 = "roboshop-http-settings"
          + pick_host_name_from_backend_address  = false
          + port                                 = 80
          + probe_id                             = (known after apply)
          + protocol                             = "Http"
          + request_timeout                      = 30
          + sni_validation_enabled               = true
          + trusted_root_certificate_names       = []
            # (5 unchanged attributes hidden)
        }

      + frontend_ip_configuration {
          + id                            = (known after apply)
          + name                          = "public-frontend"
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "Dynamic"
          + private_link_configuration_id = (known after apply)
          + public_ip_address_id          = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/publicIPAddresses/roboshop-appgw-public-ip"
        }

      + frontend_port {
          + id   = (known after apply)
          + name = "http-port"
          + port = 80
        }

      + gateway_ip_configuration {
          + id        = (known after apply)
          + name      = "gateway-ip-config"
          + subnet_id = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/appgw-subnet"
        }

      + http_listener {
          + frontend_ip_configuration_id   = (known after apply)
          + frontend_ip_configuration_name = "public-frontend"
          + frontend_port_id               = (known after apply)
          + frontend_port_name             = "http-port"
          + host_names                     = []
          + id                             = (known after apply)
          + name                           = "roboshop-http-listener"
          + protocol                       = "Http"
          + ssl_certificate_id             = (known after apply)
          + ssl_profile_id                 = (known after apply)
            # (4 unchanged attributes hidden)
        }

      + request_routing_rule {
          + backend_address_pool_id     = (known after apply)
          + backend_address_pool_name   = "roboshop-backend"
          + backend_http_settings_id    = (known after apply)
          + backend_http_settings_name  = "roboshop-http-settings"
          + http_listener_id            = (known after apply)
          + http_listener_name          = "roboshop-http-listener"
          + id                          = (known after apply)
          + name                        = "roboshop-routing"
          + priority                    = 100
          + redirect_configuration_id   = (known after apply)
          + rewrite_rule_set_id         = (known after apply)
          + rule_type                   = "Basic"
          + url_path_map_id             = (known after apply)
            # (3 unchanged attributes hidden)
        }

      + sku {
          + name = "WAF_v2"
          + tier = "WAF_v2"
        }

      + ssl_policy (known after apply)
    }

  # module.application_gateway.azurerm_web_application_firewall_policy.this will be created
  + resource "azurerm_web_application_firewall_policy" "this" {
      + http_listener_ids   = (known after apply)
      + id                  = (known after apply)
      + location            = "southindia"
      + name                = "roboshop-appgw-waf-policy"
      + path_based_rule_ids = (known after apply)
      + resource_group_name = "roboshop-rg"
      + tags                = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }

      + managed_rules {
          + managed_rule_set {
              + type    = "OWASP"
              + version = "3.2"
            }
        }

      + policy_settings {
          + enabled                                   = true
          + file_upload_enforcement                   = (known after apply)
          + file_upload_limit_in_mb                   = 100
          + js_challenge_cookie_expiration_in_minutes = 30
          + max_request_body_size_in_kb               = 128
          + mode                                      = "Prevention"
          + request_body_check                        = true
          + request_body_enforcement                  = true
          + request_body_inspect_limit_in_kb          = 128
        }
    }

  # module.database.azurerm_mysql_flexible_database.roboshop will be created
  + resource "azurerm_mysql_flexible_database" "roboshop" {
      + charset             = "utf8mb4"
      + collation           = "utf8mb4_unicode_ci"
      + id                  = (known after apply)
      + name                = "roboshop"
      + resource_group_name = "roboshop-rg"
      + server_name         = "roboshop-mysql-server"
    }

  # module.database.azurerm_mysql_flexible_server.this will be created
  + resource "azurerm_mysql_flexible_server" "this" {
      + administrator_login           = "roboshopadmin"
      + administrator_password        = (sensitive value)
      + administrator_password_wo     = (write-only attribute)
      + backup_retention_days         = 7
      + delegated_subnet_id           = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet"
      + fqdn                          = (known after apply)
      + geo_redundant_backup_enabled  = false
      + id                            = (known after apply)
      + location                      = "southindia"
      + name                          = "roboshop-mysql-server"
      + private_dns_zone_id           = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com"
      + public_network_access         = (known after apply)
      + public_network_access_enabled = (known after apply)
      + replica_capacity              = (known after apply)
      + replication_role              = (known after apply)
      + resource_group_name           = "roboshop-rg"
      + sku_name                      = "B_Standard_B1ms"
      + tags                          = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + version                       = "8.0.21"
      + zone                          = "1"

      + storage {
          + auto_grow_enabled   = true
          + io_scaling_enabled  = false
          + iops                = (known after apply)
          + log_on_disk_enabled = false
          + size_gb             = 20
        }
    }

Plan: 4 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  + mysql_server_fqdn             = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.application_gateway.azurerm_web_application_firewall_policy.this: Creating...
module.database.azurerm_mysql_flexible_server.this: Creating...
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Modifying... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]
module.application_gateway.azurerm_web_application_firewall_policy.this: Creation complete after 2s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/applicationGatewayWebApplicationFirewallPolicies/roboshop-appgw-waf-policy]
module.application_gateway.azurerm_application_gateway.this: Creating...
module.database.azurerm_mysql_flexible_server.this: Still creating... [10s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still modifying... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-...erService/managedClusters/roboshop-aks, 10s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [20s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still modifying... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-...erService/managedClusters/roboshop-aks, 20s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [20s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [30s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still modifying... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-...erService/managedClusters/roboshop-aks, 30s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [30s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Modifications complete after 35s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]
module.database.azurerm_mysql_flexible_server.this: Still creating... [40s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [40s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [50s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [50s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [1m0s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [1m0s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [1m10s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [1m20s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [1m30s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [1m40s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [1m50s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [2m0s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [2m10s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [2m20s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [2m30s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [2m40s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [2m50s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [3m0s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [3m10s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [3m20s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [3m30s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [3m40s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [3m50s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [4m0s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [4m10s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [4m20s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [4m30s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [4m40s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [4m50s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [5m0s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [5m10s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [5m20s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [5m30s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [5m40s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [5m50s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [6m0s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [6m10s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [6m20s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [6m30s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [6m40s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [6m50s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [7m0s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [7m10s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [7m20s elapsed]
module.application_gateway.azurerm_application_gateway.this: Still creating... [7m30s elapsed]
module.application_gateway.azurerm_application_gateway.this: Creation complete after 7m39s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/applicationGateways/roboshop-appgw]
╷
│ Error: creating Flexible Server (Subscription: "ee6ecc1b-df3d-42ff-b352-9685a8d6609c"
│ Resource Group Name: "roboshop-rg"
│ Flexible Server Name: "roboshop-mysql-server"): polling after Create: polling failed: the Azure API returned the following error:
│
│ Status: "AvailableZoneNotFound"
│ Code: ""
│ Message: "The availiabilityZone '1' is not found for subscription id 'ee6ecc1b-df3d-42ff-b352-9685a8d6609c'."
│ Activity Id: ""
│
│ ---
│
│ API Response:
│
│ ----[start]----
│ {"name":"317aa98f-bf01-49e0-8708-aab2f9d23100","status":"Failed","startTime":"2026-09-18T05:09:41.057Z","error":{"code":"AvailableZoneNotFound","message":"The availiabilityZone '1' is not found for subscription id 'ee6ecc1b-df3d-42ff-b352-9685a8d6609c'."}}
│ -----[end]-----
│
│
│   with module.database.azurerm_mysql_flexible_server.this,
│   on ..\modules\database\main.tf line 17, in resource "azurerm_mysql_flexible_server" "this":
│   17: resource "azurerm_mysql_flexible_server" "this" {
│
╵

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform init
Initializing the backend...
Initializing modules...
Initializing provider plugins...
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Using previously-installed hashicorp/azurerm v4.81.0

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform plan
module.resource_group.azurerm_resource_group.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg]
module.application_gateway.azurerm_public_ip.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/publicIPAddresses/roboshop-appgw-public-ip]
module.database.azurerm_private_dns_zone.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com]
module.application_gateway.azurerm_web_application_firewall_policy.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/applicationGatewayWebApplicationFirewallPolicies/roboshop-appgw-waf-policy]
module.network.azurerm_virtual_network.roboshop_vnet: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet]
module.network.azurerm_subnet.roboshop_aks: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/aks-subnet]
module.network.azurerm_subnet.roboshop_appgw: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/appgw-subnet]
module.network.azurerm_subnet.roboshop_database: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet]
module.application_gateway.azurerm_application_gateway.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/applicationGateways/roboshop-appgw]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com/virtualNetworkLinks/roboshop-mysql-server-vnet-link]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # module.aks.azurerm_kubernetes_cluster.rooboshop_aks will be updated in-place
  ~ resource "azurerm_kubernetes_cluster" "rooboshop_aks" {
        id                                  = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks"
        name                                = "roboshop-aks"
        tags                                = {
            "environment" = "dev"
            "managed_by"  = "terraform"
            "project"     = "roboshop"
        }
        # (37 unchanged attributes hidden)

      ~ default_node_pool {
            name                          = "system"
            tags                          = {}
            # (31 unchanged attributes hidden)

          - upgrade_settings {
              - drain_timeout_in_minutes      = 0 -> null
              - max_surge                     = "10%" -> null
              - node_soak_duration_in_minutes = 0 -> null
                # (1 unchanged attribute hidden)
            }
        }

        # (6 unchanged blocks hidden)
    }

  # module.database.azurerm_mysql_flexible_database.roboshop will be created
  + resource "azurerm_mysql_flexible_database" "roboshop" {
      + charset             = "utf8mb4"
      + collation           = "utf8mb4_unicode_ci"
      + id                  = (known after apply)
      + name                = "roboshop"
      + resource_group_name = "roboshop-rg"
      + server_name         = "roboshop-mysql-server"
    }

  # module.database.azurerm_mysql_flexible_server.this will be created
  + resource "azurerm_mysql_flexible_server" "this" {
      + administrator_login           = "roboshopadmin"
      + administrator_password        = (sensitive value)
      + administrator_password_wo     = (write-only attribute)
      + backup_retention_days         = 7
      + delegated_subnet_id           = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet"
      + fqdn                          = (known after apply)
      + geo_redundant_backup_enabled  = false
      + id                            = (known after apply)
      + location                      = "southindia"
      + name                          = "roboshop-mysql-server"
      + private_dns_zone_id           = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com"
      + public_network_access         = (known after apply)
      + public_network_access_enabled = (known after apply)
      + replica_capacity              = (known after apply)
      + replication_role              = (known after apply)
      + resource_group_name           = "roboshop-rg"
      + sku_name                      = "B_Standard_B1ms"
      + tags                          = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + version                       = "8.0.21"
      + zone                          = (known after apply)

      + storage {
          + auto_grow_enabled   = true
          + io_scaling_enabled  = false
          + iops                = (known after apply)
          + log_on_disk_enabled = false
          + size_gb             = 20
        }
    }

Plan: 2 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  + mysql_server_fqdn             = (known after apply)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform apply
module.resource_group.azurerm_resource_group.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg]
module.application_gateway.azurerm_public_ip.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/publicIPAddresses/roboshop-appgw-public-ip]
module.database.azurerm_private_dns_zone.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com]
module.application_gateway.azurerm_web_application_firewall_policy.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/applicationGatewayWebApplicationFirewallPolicies/roboshop-appgw-waf-policy]
module.network.azurerm_virtual_network.roboshop_vnet: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet]
module.network.azurerm_subnet.roboshop_appgw: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/appgw-subnet]
module.network.azurerm_subnet.roboshop_aks: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/aks-subnet]
module.network.azurerm_subnet.roboshop_database: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet]
module.database.azurerm_private_dns_zone_virtual_network_link.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com/virtualNetworkLinks/roboshop-mysql-server-vnet-link]
module.application_gateway.azurerm_application_gateway.this: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/applicationGateways/roboshop-appgw]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Refreshing state... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
  ~ update in-place

Terraform will perform the following actions:

  # module.aks.azurerm_kubernetes_cluster.rooboshop_aks will be updated in-place
  ~ resource "azurerm_kubernetes_cluster" "rooboshop_aks" {
        id                                  = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks"
        name                                = "roboshop-aks"
        tags                                = {
            "environment" = "dev"
            "managed_by"  = "terraform"
            "project"     = "roboshop"
        }
        # (37 unchanged attributes hidden)

      ~ default_node_pool {
            name                          = "system"
            tags                          = {}
            # (31 unchanged attributes hidden)

          - upgrade_settings {
              - drain_timeout_in_minutes      = 0 -> null
              - max_surge                     = "10%" -> null
              - node_soak_duration_in_minutes = 0 -> null
                # (1 unchanged attribute hidden)
            }
        }

        # (6 unchanged blocks hidden)
    }

  # module.database.azurerm_mysql_flexible_database.roboshop will be created
  + resource "azurerm_mysql_flexible_database" "roboshop" {
      + charset             = "utf8mb4"
      + collation           = "utf8mb4_unicode_ci"
      + id                  = (known after apply)
      + name                = "roboshop"
      + resource_group_name = "roboshop-rg"
      + server_name         = "roboshop-mysql-server"
    }

  # module.database.azurerm_mysql_flexible_server.this will be created
  + resource "azurerm_mysql_flexible_server" "this" {
      + administrator_login           = "roboshopadmin"
      + administrator_password        = (sensitive value)
      + administrator_password_wo     = (write-only attribute)
      + backup_retention_days         = 7
      + delegated_subnet_id           = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet/subnets/database-subnet"
      + fqdn                          = (known after apply)
      + geo_redundant_backup_enabled  = false
      + id                            = (known after apply)
      + location                      = "southindia"
      + name                          = "roboshop-mysql-server"
      + private_dns_zone_id           = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/privateDnsZones/roboshop-mysql-server.private.mysql.database.azure.com"
      + public_network_access         = (known after apply)
      + public_network_access_enabled = (known after apply)
      + replica_capacity              = (known after apply)
      + replication_role              = (known after apply)
      + resource_group_name           = "roboshop-rg"
      + sku_name                      = "B_Standard_B1ms"
      + tags                          = {
          + "environment" = "dev"
          + "managed_by"  = "terraform"
          + "project"     = "roboshop"
        }
      + version                       = "8.0.21"
      + zone                          = (known after apply)

      + storage {
          + auto_grow_enabled   = true
          + io_scaling_enabled  = false
          + iops                = (known after apply)
          + log_on_disk_enabled = false
          + size_gb             = 20
        }
    }

Plan: 2 to add, 1 to change, 0 to destroy.

Changes to Outputs:
  + mysql_server_fqdn             = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.database.azurerm_mysql_flexible_server.this: Creating...
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Modifying... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]
module.database.azurerm_mysql_flexible_server.this: Still creating... [10s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still modifying... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-...erService/managedClusters/roboshop-aks, 10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [20s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Still modifying... [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-...erService/managedClusters/roboshop-aks, 20s elapsed]
module.aks.azurerm_kubernetes_cluster.rooboshop_aks: Modifications complete after 25s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.ContainerService/managedClusters/roboshop-aks]
module.database.azurerm_mysql_flexible_server.this: Still creating... [30s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [40s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [50s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [1m0s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [1m10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [1m20s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [1m30s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [1m40s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [1m50s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [2m0s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [2m10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [2m20s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [2m30s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [2m40s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [2m50s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [3m0s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [3m10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [3m20s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [3m30s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [3m40s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [3m50s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [4m0s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [4m10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [4m20s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [4m30s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [4m40s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [4m50s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [5m0s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [5m10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [5m20s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [5m30s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [5m40s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [5m50s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [6m0s elapsed]
module.database.azurerm_mysql_flexible_server.this: Still creating... [6m10s elapsed]
module.database.azurerm_mysql_flexible_server.this: Creation complete after 6m15s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.DBforMySQL/flexibleServers/roboshop-mysql-server]
module.database.azurerm_mysql_flexible_database.roboshop: Creating...
module.database.azurerm_mysql_flexible_database.roboshop: Still creating... [10s elapsed]
module.database.azurerm_mysql_flexible_database.roboshop: Still creating... [20s elapsed]
module.database.azurerm_mysql_flexible_database.roboshop: Creation complete after 22s [id=/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.DBforMySQL/flexibleServers/roboshop-mysql-server/databases/roboshop]

Apply complete! Resources: 2 added, 1 changed, 0 destroyed.

Outputs:

aks_cluster_name = "roboshop-aks"
aks_oidc_issuer_url = "https://southindia.oic.prod-aks.azure.com/594edd5d-7e42-42e5-8fe6-e742572b2e9a/50ba213c-4abf-4fdb-b686-d57dbe858ebd/"
application_gateway_public_ip = "20.219.114.159"
mysql_database = "roboshop"
mysql_server_fqdn = "roboshop-mysql-server.mysql.database.azure.com"
resource_group_name = "roboshop-rg"
vnet_id = "/subscriptions/ee6ecc1b-df3d-42ff-b352-9685a8d6609c/resourceGroups/roboshop-rg/providers/Microsoft.Network/virtualNetworks/roboshop-vnet"

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ kubectl config current-context
roboshop-aks-admin

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ kubectl config get-contexts
CURRENT   NAME                                                  CLUSTER                                               AUTHINFO
NAMESPACE
          docker-desktop                                        docker-desktop                                        docker-desktop
          gke_noted-ensign-430105-m3_us-central1-c_venkatgcp    gke_noted-ensign-430105-m3_us-central1-c_venkatgcp    gke_noted-ensign-430105-m3_us-central1-c_venkatgcp
          gke_noted-ensign-430105-m3_us-central1-c_venkatkube   gke_noted-ensign-430105-m3_us-central1-c_venkatkube   gke_noted-ensign-430105-m3_us-central1-c_venkatkube
          kind-k8sgpt-demo                                      kind-k8sgpt-demo                                      kind-k8sgpt-demo
          roboshop-aks                                          roboshop-aks                                          clusterUser_roboshop-rg_roboshop-aks
*         roboshop-aks-admin                                    roboshop-aks                                          clusterAdmin_roboshop-rg_roboshop-aks

venka@Think-VVRAM MINGW64 /c/AZURE/azure-terraform-infra/aks
$ terraform init
```
