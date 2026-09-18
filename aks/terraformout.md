```
[0m[1mInitializing the backend...[0m
[0m[1mInitializing modules...[0m
[0m[1mInitializing provider plugins...[0m
- Reusing previous version of hashicorp/azurerm from the dependency lock file
- Using previously-installed hashicorp/azurerm v4.81.0

[0m[1m[32mTerraform has been successfully initialized![0m[32m[0m
[0m[32m
You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.[0m

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  [32m+[0m create[0m

Terraform will perform the following actions:

[1m  # module.aks.azurerm_kubernetes_cluster.rooboshop_aks[0m will be created
[0m  [32m+[0m[0m resource "azurerm_kubernetes_cluster" "rooboshop_aks" {
      [32m+[0m[0m ai_toolchain_operator_enabled       = false
      [32m+[0m[0m current_kubernetes_version          = (known after apply)
      [32m+[0m[0m dns_prefix                          = "roboshop-aks"
      [32m+[0m[0m fqdn                                = (known after apply)
      [32m+[0m[0m http_application_routing_zone_name  = (known after apply)
      [32m+[0m[0m id                                  = (known after apply)
      [32m+[0m[0m kube_admin_config                   = (sensitive value)
      [32m+[0m[0m kube_admin_config_raw               = (sensitive value)
      [32m+[0m[0m kube_config                         = (sensitive value)
      [32m+[0m[0m kube_config_raw                     = (sensitive value)
      [32m+[0m[0m kubernetes_version                  = (known after apply)
      [32m+[0m[0m location                            = "southindia"
      [32m+[0m[0m name                                = "roboshop-aks"
      [32m+[0m[0m node_os_upgrade_channel             = "NodeImage"
      [32m+[0m[0m node_resource_group                 = (known after apply)
      [32m+[0m[0m node_resource_group_id              = (known after apply)
      [32m+[0m[0m oidc_issuer_enabled                 = (known after apply)
      [32m+[0m[0m oidc_issuer_url                     = (known after apply)
      [32m+[0m[0m portal_fqdn                         = (known after apply)
      [32m+[0m[0m private_cluster_enabled             = false
      [32m+[0m[0m private_cluster_public_fqdn_enabled = false
      [32m+[0m[0m private_dns_zone_id                 = (known after apply)
      [32m+[0m[0m private_fqdn                        = (known after apply)
      [32m+[0m[0m resource_group_name                 = "roboshop-rg"
      [32m+[0m[0m role_based_access_control_enabled   = true
      [32m+[0m[0m run_command_enabled                 = true
      [32m+[0m[0m sku_tier                            = "Free"
      [32m+[0m[0m support_plan                        = "KubernetesOfficial"
      [32m+[0m[0m tags                                = {
          [32m+[0m[0m "environment" = "dev"
          [32m+[0m[0m "managed_by"  = "terraform"
          [32m+[0m[0m "project"     = "roboshop"
        }
      [32m+[0m[0m workload_identity_enabled           = false

      [32m+[0m[0m auto_scaler_profile (known after apply)

      [32m+[0m[0m bootstrap_profile (known after apply)

      [32m+[0m[0m default_node_pool {
          [32m+[0m[0m kubelet_disk_type            = (known after apply)
          [32m+[0m[0m max_pods                     = (known after apply)
          [32m+[0m[0m name                         = "system"
          [32m+[0m[0m node_count                   = 2
          [32m+[0m[0m node_labels                  = (known after apply)
          [32m+[0m[0m only_critical_addons_enabled = true
          [32m+[0m[0m orchestrator_version         = (known after apply)
          [32m+[0m[0m os_disk_size_gb              = (known after apply)
          [32m+[0m[0m os_disk_type                 = "Managed"
          [32m+[0m[0m os_sku                       = (known after apply)
          [32m+[0m[0m scale_down_mode              = "Delete"
          [32m+[0m[0m type                         = "VirtualMachineScaleSets"
          [32m+[0m[0m ultra_ssd_enabled            = false
          [32m+[0m[0m vm_size                      = "Standard_D2s_v5"
          [32m+[0m[0m vnet_subnet_id               = (known after apply)
          [32m+[0m[0m workload_runtime             = (known after apply)
        }

      [32m+[0m[0m identity {
          [32m+[0m[0m principal_id = (known after apply)
          [32m+[0m[0m tenant_id    = (known after apply)
          [32m+[0m[0m type         = "SystemAssigned"
        }

      [32m+[0m[0m kubelet_identity (known after apply)

      [32m+[0m[0m network_profile {
          [32m+[0m[0m dns_service_ip      = "10.10.0.10"
          [32m+[0m[0m ip_versions         = (known after apply)
          [32m+[0m[0m load_balancer_sku   = "standard"
          [32m+[0m[0m network_data_plane  = "azure"
          [32m+[0m[0m network_mode        = (known after apply)
          [32m+[0m[0m network_plugin      = "azure"
          [32m+[0m[0m network_plugin_mode = "overlay"
          [32m+[0m[0m network_policy      = "azure"
          [32m+[0m[0m outbound_type       = "loadBalancer"
          [32m+[0m[0m pod_cidr            = "10.244.0.0/16"
          [32m+[0m[0m pod_cidrs           = (known after apply)
          [32m+[0m[0m service_cidr        = "10.10.0.0/16"
          [32m+[0m[0m service_cidrs       = (known after apply)

          [32m+[0m[0m load_balancer_profile (known after apply)

          [32m+[0m[0m nat_gateway_profile (known after apply)
        }

      [32m+[0m[0m node_provisioning_profile (known after apply)

      [32m+[0m[0m windows_profile (known after apply)
    }

[1m  # module.application_gateway.azurerm_application_gateway.this[0m will be created
[0m  [32m+[0m[0m resource "azurerm_application_gateway" "this" {
      [32m+[0m[0m enable_http2                = (known after apply)
      [32m+[0m[0m http2_enabled               = (known after apply)
      [32m+[0m[0m id                          = (known after apply)
      [32m+[0m[0m location                    = "southindia"
      [32m+[0m[0m name                        = "roboshop-appgw"
      [32m+[0m[0m private_endpoint_connection = (known after apply)
      [32m+[0m[0m resource_group_name         = "roboshop-rg"
      [32m+[0m[0m tags                        = {
          [32m+[0m[0m "environment" = "dev"
          [32m+[0m[0m "managed_by"  = "terraform"
          [32m+[0m[0m "project"     = "roboshop"
        }

      [32m+[0m[0m autoscale_configuration {
          [32m+[0m[0m max_capacity = 2
          [32m+[0m[0m min_capacity = 1
        }

      [32m+[0m[0m backend_address_pool {
          [32m+[0m[0m fqdns        = []
          [32m+[0m[0m id           = (known after apply)
          [32m+[0m[0m ip_addresses = []
          [32m+[0m[0m name         = "roboshop-backend"
        }

      [32m+[0m[0m backend_http_settings {
          [32m+[0m[0m certificate_chain_validation_enabled = true
          [32m+[0m[0m cookie_based_affinity                = "Disabled"
          [32m+[0m[0m dedicated_backend_connection_enabled = false
          [32m+[0m[0m id                                   = (known after apply)
          [32m+[0m[0m name                                 = "roboshop-http-settings"
          [32m+[0m[0m pick_host_name_from_backend_address  = false
          [32m+[0m[0m port                                 = 80
          [32m+[0m[0m probe_id                             = (known after apply)
          [32m+[0m[0m protocol                             = "Http"
          [32m+[0m[0m request_timeout                      = 30
          [32m+[0m[0m sni_validation_enabled               = true
          [32m+[0m[0m trusted_root_certificate_names       = []
            [90m# (5 unchanged attributes hidden)[0m[0m
        }

      [32m+[0m[0m frontend_ip_configuration {
          [32m+[0m[0m id                            = (known after apply)
          [32m+[0m[0m name                          = "public-frontend"
          [32m+[0m[0m private_ip_address            = (known after apply)
          [32m+[0m[0m private_ip_address_allocation = "Dynamic"
          [32m+[0m[0m private_link_configuration_id = (known after apply)
          [32m+[0m[0m public_ip_address_id          = (known after apply)
        }

      [32m+[0m[0m frontend_port {
          [32m+[0m[0m id   = (known after apply)
          [32m+[0m[0m name = "http-port"
          [32m+[0m[0m port = 80
        }

      [32m+[0m[0m gateway_ip_configuration {
          [32m+[0m[0m id        = (known after apply)
          [32m+[0m[0m name      = "gateway-ip-config"
          [32m+[0m[0m subnet_id = (known after apply)
        }

      [32m+[0m[0m http_listener {
          [32m+[0m[0m frontend_ip_configuration_id   = (known after apply)
          [32m+[0m[0m frontend_ip_configuration_name = "public-frontend"
          [32m+[0m[0m frontend_port_id               = (known after apply)
          [32m+[0m[0m frontend_port_name             = "http-port"
          [32m+[0m[0m host_names                     = []
          [32m+[0m[0m id                             = (known after apply)
          [32m+[0m[0m name                           = "roboshop-http-listener"
          [32m+[0m[0m protocol                       = "Http"
          [32m+[0m[0m ssl_certificate_id             = (known after apply)
          [32m+[0m[0m ssl_profile_id                 = (known after apply)
            [90m# (4 unchanged attributes hidden)[0m[0m
        }

      [32m+[0m[0m request_routing_rule {
          [32m+[0m[0m backend_address_pool_id     = (known after apply)
          [32m+[0m[0m backend_address_pool_name   = "roboshop-backend"
          [32m+[0m[0m backend_http_settings_id    = (known after apply)
          [32m+[0m[0m backend_http_settings_name  = "roboshop-http-settings"
          [32m+[0m[0m http_listener_id            = (known after apply)
          [32m+[0m[0m http_listener_name          = "roboshop-http-listener"
          [32m+[0m[0m id                          = (known after apply)
          [32m+[0m[0m name                        = "roboshop-routing"
          [32m+[0m[0m priority                    = 100
          [32m+[0m[0m redirect_configuration_id   = (known after apply)
          [32m+[0m[0m rewrite_rule_set_id         = (known after apply)
          [32m+[0m[0m rule_type                   = "Basic"
          [32m+[0m[0m url_path_map_id             = (known after apply)
            [90m# (3 unchanged attributes hidden)[0m[0m
        }

      [32m+[0m[0m sku {
          [32m+[0m[0m name = "WAF_v2"
          [32m+[0m[0m tier = "WAF_v2"
        }

      [32m+[0m[0m ssl_policy (known after apply)
    }

[1m  # module.application_gateway.azurerm_public_ip.this[0m will be created
[0m  [32m+[0m[0m resource "azurerm_public_ip" "this" {
      [32m+[0m[0m allocation_method       = "Static"
      [32m+[0m[0m ddos_protection_mode    = "VirtualNetworkInherited"
      [32m+[0m[0m fqdn                    = (known after apply)
      [32m+[0m[0m id                      = (known after apply)
      [32m+[0m[0m idle_timeout_in_minutes = 4
      [32m+[0m[0m ip_address              = (known after apply)
      [32m+[0m[0m ip_version              = "IPv4"
      [32m+[0m[0m location                = "southindia"
      [32m+[0m[0m name                    = "roboshop-appgw-public-ip"
      [32m+[0m[0m resource_group_name     = "roboshop-rg"
      [32m+[0m[0m sku                     = "Standard"
      [32m+[0m[0m sku_tier                = "Regional"
    }

[1m  # module.database.azurerm_mysql_flexible_database.roboshop[0m will be created
[0m  [32m+[0m[0m resource "azurerm_mysql_flexible_database" "roboshop" {
      [32m+[0m[0m charset             = "utf8mb4"
      [32m+[0m[0m collation           = "utf8mb4_unicode_ci"
      [32m+[0m[0m id                  = (known after apply)
      [32m+[0m[0m name                = "roboshop"
      [32m+[0m[0m resource_group_name = "roboshop-rg"
      [32m+[0m[0m server_name         = "roboshop-mysql-server"
    }

[1m  # module.database.azurerm_mysql_flexible_server.this[0m will be created
[0m  [32m+[0m[0m resource "azurerm_mysql_flexible_server" "this" {
      [32m+[0m[0m administrator_login           = "roboshopadmin"
      [32m+[0m[0m administrator_password        = (sensitive value)
      [32m+[0m[0m administrator_password_wo     = (write-only attribute)
      [32m+[0m[0m backup_retention_days         = 7
      [32m+[0m[0m delegated_subnet_id           = (known after apply)
      [32m+[0m[0m fqdn                          = (known after apply)
      [32m+[0m[0m geo_redundant_backup_enabled  = false
      [32m+[0m[0m id                            = (known after apply)
      [32m+[0m[0m location                      = "southindia"
      [32m+[0m[0m name                          = "roboshop-mysql-server"
      [32m+[0m[0m private_dns_zone_id           = (known after apply)
      [32m+[0m[0m public_network_access         = (known after apply)
      [32m+[0m[0m public_network_access_enabled = (known after apply)
      [32m+[0m[0m replica_capacity              = (known after apply)
      [32m+[0m[0m replication_role              = (known after apply)
      [32m+[0m[0m resource_group_name           = "roboshop-rg"
      [32m+[0m[0m sku_name                      = "B_Standard_B1ms"
      [32m+[0m[0m tags                          = {
          [32m+[0m[0m "environment" = "dev"
          [32m+[0m[0m "managed_by"  = "terraform"
          [32m+[0m[0m "project"     = "roboshop"
        }
      [32m+[0m[0m version                       = "8.0.21"
      [32m+[0m[0m zone                          = "1"

      [32m+[0m[0m storage {
          [32m+[0m[0m auto_grow_enabled   = true
          [32m+[0m[0m io_scaling_enabled  = false
          [32m+[0m[0m iops                = (known after apply)
          [32m+[0m[0m log_on_disk_enabled = false
          [32m+[0m[0m size_gb             = 20
        }
    }

[1m  # module.database.azurerm_private_dns_zone.this[0m will be created
[0m  [32m+[0m[0m resource "azurerm_private_dns_zone" "this" {
      [32m+[0m[0m id                                                    = (known after apply)
      [32m+[0m[0m max_number_of_record_sets                             = (known after apply)
      [32m+[0m[0m max_number_of_virtual_network_links                   = (known after apply)
      [32m+[0m[0m max_number_of_virtual_network_links_with_registration = (known after apply)
      [32m+[0m[0m name                                                  = "roboshop-mysql-server.private.mysql.database.azure.com"
      [32m+[0m[0m number_of_record_sets                                 = (known after apply)
      [32m+[0m[0m resource_group_name                                   = "roboshop-rg"
      [32m+[0m[0m tags                                                  = {
          [32m+[0m[0m "environment" = "dev"
          [32m+[0m[0m "managed_by"  = "terraform"
          [32m+[0m[0m "project"     = "roboshop"
        }

      [32m+[0m[0m soa_record (known after apply)
    }

[1m  # module.database.azurerm_private_dns_zone_virtual_network_link.this[0m will be created
[0m  [32m+[0m[0m resource "azurerm_private_dns_zone_virtual_network_link" "this" {
      [32m+[0m[0m id                    = (known after apply)
      [32m+[0m[0m name                  = "roboshop-mysql-server-vnet-link"
      [32m+[0m[0m private_dns_zone_name = "roboshop-mysql-server.private.mysql.database.azure.com"
      [32m+[0m[0m registration_enabled  = false
      [32m+[0m[0m resolution_policy     = (known after apply)
      [32m+[0m[0m resource_group_name   = "roboshop-rg"
      [32m+[0m[0m tags                  = {
          [32m+[0m[0m "environment" = "dev"
          [32m+[0m[0m "managed_by"  = "terraform"
          [32m+[0m[0m "project"     = "roboshop"
        }
      [32m+[0m[0m virtual_network_id    = (known after apply)
    }

[1m  # module.network.azurerm_subnet.roboshop_aks[0m will be created
[0m  [32m+[0m[0m resource "azurerm_subnet" "roboshop_aks" {
      [32m+[0m[0m address_prefixes                              = [
          [32m+[0m[0m "10.0.1.0/24",
        ]
      [32m+[0m[0m default_outbound_access_enabled               = true
      [32m+[0m[0m id                                            = (known after apply)
      [32m+[0m[0m name                                          = "aks-subnet"
      [32m+[0m[0m private_endpoint_network_policies             = "Disabled"
      [32m+[0m[0m private_link_service_network_policies_enabled = true
      [32m+[0m[0m resource_group_name                           = "roboshop-rg"
      [32m+[0m[0m virtual_network_name                          = "roboshop-vnet"
    }

[1m  # module.network.azurerm_subnet.roboshop_appgw[0m will be created
[0m  [32m+[0m[0m resource "azurerm_subnet" "roboshop_appgw" {
      [32m+[0m[0m address_prefixes                              = [
          [32m+[0m[0m "10.0.2.0/24",
        ]
      [32m+[0m[0m default_outbound_access_enabled               = true
      [32m+[0m[0m id                                            = (known after apply)
      [32m+[0m[0m name                                          = "appgw-subnet"
      [32m+[0m[0m private_endpoint_network_policies             = "Disabled"
      [32m+[0m[0m private_link_service_network_policies_enabled = true
      [32m+[0m[0m resource_group_name                           = "roboshop-rg"
      [32m+[0m[0m virtual_network_name                          = "roboshop-vnet"
    }

[1m  # module.network.azurerm_subnet.roboshop_database[0m will be created
[0m  [32m+[0m[0m resource "azurerm_subnet" "roboshop_database" {
      [32m+[0m[0m address_prefixes                              = [
          [32m+[0m[0m "10.0.3.0/24",
        ]
      [32m+[0m[0m default_outbound_access_enabled               = true
      [32m+[0m[0m id                                            = (known after apply)
      [32m+[0m[0m name                                          = "database-subnet"
      [32m+[0m[0m private_endpoint_network_policies             = "Disabled"
      [32m+[0m[0m private_link_service_network_policies_enabled = true
      [32m+[0m[0m resource_group_name                           = "roboshop-rg"
      [32m+[0m[0m virtual_network_name                          = "roboshop-vnet"

      [32m+[0m[0m delegation {
          [32m+[0m[0m name = "database-delegation"

          [32m+[0m[0m service_delegation {
              [32m+[0m[0m actions = [
                  [32m+[0m[0m "Microsoft.Network/virtualNetworks/subnets/join/action",
                ]
              [32m+[0m[0m name    = "Microsoft.DBforMySQL/flexibleServers"
            }
        }
    }

[1m  # module.network.azurerm_virtual_network.roboshop_vnet[0m will be created
[0m  [32m+[0m[0m resource "azurerm_virtual_network" "roboshop_vnet" {
      [32m+[0m[0m address_space                  = [
          [32m+[0m[0m "10.0.0.0/16",
        ]
      [32m+[0m[0m dns_servers                    = (known after apply)
      [32m+[0m[0m guid                           = (known after apply)
      [32m+[0m[0m id                             = (known after apply)
      [32m+[0m[0m location                       = "southindia"
      [32m+[0m[0m name                           = "roboshop-vnet"
      [32m+[0m[0m private_endpoint_vnet_policies = "Disabled"
      [32m+[0m[0m resource_group_name            = "roboshop-rg"
      [32m+[0m[0m subnet                         = (known after apply)
    }

[1m  # module.resource_group.azurerm_resource_group.this[0m will be created
[0m  [32m+[0m[0m resource "azurerm_resource_group" "this" {
      [32m+[0m[0m id       = (known after apply)
      [32m+[0m[0m location = "southindia"
      [32m+[0m[0m name     = "roboshop-rg"
    }

[1mPlan:[0m 12 to add, 0 to change, 0 to destroy.
[0m
Changes to Outputs:
  [32m+[0m[0m aks_cluster_name              = "roboshop-aks"
  [32m+[0m[0m aks_oidc_issuer_url           = (known after apply)
  [32m+[0m[0m application_gateway_public_ip = (known after apply)
  [32m+[0m[0m mysql_database                = "roboshop"
  [32m+[0m[0m mysql_server_fqdn             = (known after apply)
  [32m+[0m[0m resource_group_name           = "roboshop-rg"
  [32m+[0m[0m vnet_id                       = (known after apply)
[90m
─────────────────────────────────────────────────────────────────────────────[0m

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
```
