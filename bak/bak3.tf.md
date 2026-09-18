# Production-style Azure AKS with Terraform

This project builds an Azure Kubernetes Service (AKS) environment using Terraform, with a dedicated virtual network, separate system and user node pools, subnet-level NSGs, NAT Gateway, managed identity, autoscaling, and monitoring-ready configuration.

The design is suitable for your DevOps and Kubernetes hands-on lab, and it can be extended for your Roboshop microservices deployment.

## 1. Target architecture

## Azure subscription

Resource group: rg-aks-prod

### Virtual Network

10.20.0.0/16

System subnet

10.20.1.0/24

System node pool • CoreDNS • cluster services

System NSG

User subnet

10.20.2.0/23

Application workloads • Roboshop microservices

User NSG

Application Gateway subnet

10.20.10.0/24

Reserved for ingress / WAF integration

Private endpoints

10.20.20.0/24

Optional private connectivity to Azure services

NAT Gateway → outbound internet

Azure Monitor / Log Analytics

Container logs • metrics • control-plane diagnostics

### Network and security decisions

|
Component

|

Design

|
| --- | --- |
|

VNet

|

`10.20.0.0/16`

|
|

System subnet

|

`10.20.1.0/24`

|
|

User subnet

|

`10.20.2.0/23`

|
|

AKS networking

|

Azure CNI Overlay

|
|

Outbound traffic

|

NAT Gateway

|
|

Identity

|

System-assigned managed identity

|
|

Node scaling

|

Cluster autoscaler

|
|

NSGs

|

Separate system and user subnet NSGs

|
|

Ingress

|

Application Gateway or Azure Load Balancer

|
|

Monitoring

|

Azure Monitor / Log Analytics

|

Important: AKS networking is not the same as a normal VM subnet. Custom NSGs must preserve AKS-required traffic, and the configuration should not blindly deny all traffic. Also, the Terraform AzureRM provider version, supported Kubernetes version, and region capacity must be checked before deployment.


## 2. Project folder structure

Create the following directory on your Windows workstation, for example under your Azure Terraform projects:

```
azure-aks-production/
├── versions.tf
├── providers.tf
├── variables.tf
├── terraform.tfvars
├── network.tf
├── nsg.tf
├── nat-gateway.tf
├── aks.tf
├── monitoring.tf
├── outputs.tf
└── README.md
```

This version uses the AzureRM provider 4.x syntax. Microsoft’s current AKS Terraform guidance also demonstrates Azure CNI Overlay and recommends production considerations such as private API access, managed identity, and upgrade configuration.

![](https://www.google.com/s2/favicons?domain=https://learn.microsoft.com\&sz=32)

Microsoft Learn

+1


## 3. Terraform configuration

The following is a practical starter configuration. It creates the VNet, two AKS subnets, NSGs, a NAT Gateway, and an AKS cluster. The configuration uses Azure CNI Overlay, where pod IPs come from a separate pod CIDR rather than consuming an Azure VNet IP for every pod.

![](https://www.google.com/s2/favicons?domain=https://learn.microsoft.com\&sz=32)

Microsoft Learn

### `versions.tf`

hcl

```
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
```

### `providers.tf`

hcl

```
provider "azurerm" {
  features {}
}
```

### `variables.tf`

hcl

```
variable "resource_group_name" {
  description = "Resource group for AKS infrastructure"
  type        = string
  default     = "rg-aks-prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "cluster_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-prod-demo"
}

variable "kubernetes_version" {
  description = "Supported AKS Kubernetes version"
  type        = string
  default     = null
}

variable "system_vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}

variable "user_vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}

variable "system_node_min" {
  type    = number
  default = 2
}

variable "system_node_max" {
  type    = number
  default = 3
}

variable "user_node_min" {
  type    = number
  default = 1
}

variable "user_node_max" {
  type    = number
  default = 3
}
```

### `terraform.tfvars`

hcl

```
resource_group_name = "rg-aks-prod"
location            = "Central India"
cluster_name        = "aks-prod-demo"

# Leave null to let AKS use its default supported version.
kubernetes_version = null

system_vm_size = "Standard_D2s_v5"
user_vm_size   = "Standard_D2s_v5"

system_node_min = 2
system_node_max = 3

user_node_min = 1
user_node_max = 3
```

Cost note: Two system nodes and one user node can generate Azure charges. Check your subscription quota and VM availability before applying.

## 4. Create the VNet and subnets

### `network.tf`

hcl

```
resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
    Project     = "AKS"
  }
}

resource "azurerm_virtual_network" "aks" {
  name                = "vnet-aks-prod"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  address_space = ["10.20.0.0/16"]
}

resource "azurerm_subnet" "system" {
  name                 = "snet-aks-system"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks.name

  address_prefixes = ["10.20.1.0/24"]
}

resource "azurerm_subnet" "user" {
  name                 = "snet-aks-user"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks.name

  address_prefixes = ["10.20.2.0/23"]
}

resource "azurerm_subnet" "app_gateway" {
  name                 = "snet-application-gateway"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks.name

  address_prefixes = ["10.20.10.0/24"]
}

resource "azurerm_subnet" "private_endpoints" {
  name                 = "snet-private-endpoints"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks.name

  address_prefixes = ["10.20.20.0/24"]
}
```

The Application Gateway and private-endpoint subnets are reserved for future integration. They are not used by the initial AKS cluster.

## 5. Create NSGs and rules

For AKS, avoid a blanket inbound deny rule unless all required AKS traffic has been designed and tested. The example below creates custom NSGs with a small set of explicit rules and relies on Azure's default NSG behavior for other traffic.

### `nsg.tf`

hcl

```
# -------------------------
# System node NSG
# -------------------------
resource "azurerm_network_security_group" "system" {
  name                = "nsg-aks-system"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  tags = {
    Environment = "production"
  }
}

# -------------------------
# User node NSG
# -------------------------
resource "azurerm_network_security_group" "user" {
  name                = "nsg-aks-user"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  tags = {
    Environment = "production"
  }
}

# -------------------------
# Allow HTTPS inbound
# -------------------------
resource "azurerm_network_security_rule" "system_https" {
  name                        = "Allow-HTTPS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.aks.name
  network_security_group_name = azurerm_network_security_group.system.name
}

resource "azurerm_network_security_rule" "user_https" {
  name                        = "Allow-HTTPS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.aks.name
  network_security_group_name = azurerm_network_security_group.user.name
}

# -------------------------
# Associate system NSG
# -------------------------
resource "azurerm_subnet_network_security_group_association" "system" {
  subnet_id                 = azurerm_subnet.system.id
  network_security_group_id = azurerm_network_security_group.system.id
}

# -------------------------
# Associate user NSG
# -------------------------
resource "azurerm_subnet_network_security_group_association" "user" {
  subnet_id                 = azurerm_subnet.user.id
  network_security_group_id = azurerm_network_security_group.user.id
}
```

### AKS NSG rules to understand

|
Rule

|

Direction

|

Typical purpose

|
| --- | --- | --- |
|

HTTPS

|

Inbound

|

Public HTTPS application traffic when the architecture permits it

|
|

HTTP

|

Inbound

|

Optional HTTP traffic or redirect endpoint

|
|

NodePort

|

Inbound

|

Only when the architecture requires NodePort access

|
|

Control-plane traffic

|

Inbound/outbound

|

AKS-required connectivity

|
|

DNS

|

Outbound

|

Cluster name resolution

|
|

HTTPS

|

Outbound

|

Access to Azure services and external endpoints

|

Production recommendation: Prefer exposing applications through an ingress controller or Azure Load Balancer rather than opening the entire NodePort range to the internet. Validate the final NSG rules against AKS networking requirements before using restrictive policies.

## 6. NAT Gateway

A NAT Gateway provides a stable outbound path for subnet resources. Azure's NAT Gateway Terraform resource supports a standard SKU and configurable idle timeout.

![](https://www.google.com/s2/favicons?domain=https://registry.terraform.io\&sz=32)

Terraform Registry

### `nat-gateway.tf`

hcl

```
resource "azurerm_public_ip" "nat" {
  name                = "pip-aks-nat"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = {
    Environment = "production"
  }
}

resource "azurerm_nat_gateway" "aks" {
  name                = "nat-aks-prod"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  sku_name                = "Standard"
  idle_timeout_in_minutes = 10

  tags = {
    Environment = "production"
  }
}

resource "azurerm_nat_gateway_public_ip_association" "aks" {
  nat_gateway_id       = azurerm_nat_gateway.aks.id
  public_ip_address_id = azurerm_public_ip.nat.id
}

resource "azurerm_subnet_nat_gateway_association" "system" {
  subnet_id      = azurerm_subnet.system.id
  nat_gateway_id = azurerm_nat_gateway.aks.id
}

resource "azurerm_subnet_nat_gateway_association" "user" {
  subnet_id      = azurerm_subnet.user.id
  nat_gateway_id = azurerm_nat_gateway.aks.id
}
```

## 7. Create the AKS cluster

### `aks.tf`

hcl

```
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "aks-prod-demo"

  kubernetes_version = var.kubernetes_version

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                 = "system"
    vm_size              = var.system_vm_size
    vnet_subnet_id       = azurerm_subnet.system.id
    auto_scaling_enabled  = true
    min_count             = var.system_node_min
    max_count             = var.system_node_max
    max_pods              = 50
    zones                 = ["1", "2", "3"]

    upgrade_settings {
      max_surge = "33%"
    }

    node_labels = {
      "workload-type" = "system"
    }
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "azure"

    pod_cidr            = "192.168.0.0/16"
    service_cidr        = "10.30.0.0/16"
    dns_service_ip      = "10.30.0.10"

    load_balancer_sku = "standard"
    outbound_type     = "userAssignedNATGateway"
  }

  role_based_access_control_enabled = true

  azure_policy_enabled = true

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks.id
  }

  tags = {
    Environment = "production"
    ManagedBy   = "Terraform"
  }

  depends_on = [
    azurerm_subnet_network_security_group_association.system,
    azurerm_subnet_network_security_group_association.user,
    azurerm_subnet_nat_gateway_association.system,
    azurerm_subnet_nat_gateway_association.user
  ]
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                  = "user"
  kubernetes_cluster_id  = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.user_vm_size
  vnet_subnet_id        = azurerm_subnet.user.id

  auto_scaling_enabled = true
  min_count            = var.user_node_min
  max_count            = var.user_node_max

  max_pods = 50
  zones    = ["1", "2", "3"]

  node_labels = {
    "workload-type" = "application"
  }

  upgrade_settings {
    max_surge = "33%"
  }

  tags = {
    Environment = "production"
  }
}
```

### Important cluster settings

* Azure CNI Overlay: Pods use the configured overlay CIDR, while nodes use the Azure subnets.

* System node pool: Hosts system-critical workloads.

* User node pool: Hosts application workloads such as Roboshop.

* Autoscaling: Changes node counts within the configured minimum and maximum.

* Workload identity: Enables supported Azure identity integration for Kubernetes workloads.

* OIDC issuer: Required for the workload identity federation pattern.

* NAT Gateway: Configured as the AKS outbound type.

The `kubernetes_version` value should be selected from versions supported by AKS in your chosen region. The AzureRM provider documentation and Microsoft AKS guidance should be checked before applying changes to an existing production cluster.

![](https://www.google.com/s2/favicons?domain=https://learn.microsoft.com\&sz=32)

Microsoft Learn

+1

## 8. Monitoring with Log Analytics

### `monitoring.tf`

hcl

```
resource "azurerm_log_analytics_workspace" "aks" {
  name                = "law-aks-prod"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = {
    Environment = "production"
  }
}
```

This workspace is referenced by the AKS monitoring configuration in `aks.tf`.

## 9. Outputs

### `outputs.tf`

hcl

```
output "resource_group_name" {
  value = azurerm_resource_group.aks.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "system_subnet_id" {
  value = azurerm_subnet.system.id
}

output "user_subnet_id" {
  value = azurerm_subnet.user.id
}

output "system_nsg_id" {
  value = azurerm_network_security_group.system.id
}

output "user_nsg_id" {
  value = azurerm_network_security_group.user.id
}

output "nat_gateway_public_ip" {
  value = azurerm_public_ip.nat.ip_address
}
```

## 10. Deploy from Windows Git Bash or PowerShell

Run these commands from the project directory:

### Terraform deployment

CLI

Bash

```
az login

az account show

# Optional: select the required subscription
az account set --subscription "<SUBSCRIPTION_ID>"

terraform init

terraform fmt -recursive

terraform validate

terraform plan -out=tfplan

terraform apply tfplan
  
```

Retrieve AKS credentials:

Bash

```
az aks get-credentials \
  --resource-group rg-aks-prod \
  --name aks-prod-demo \
  --overwrite-existing
```

Verify the cluster:

Bash

```
kubectl get nodes -o wide

kubectl get pods -A

kubectl get namespaces
```

Verify the NSGs:

Bash

```
az network nsg rule list \
  --resource-group rg-aks-prod \
  --nsg-name nsg-aks-system \
  -o table

az network nsg rule list \
  --resource-group rg-aks-prod \
  --nsg-name nsg-aks-user \
  -o table
```

Verify the NAT Gateway:

Bash

```
az network nat gateway show \
  --resource-group rg-aks-prod \
  --name nat-aks-prod
```

## 11. Deploy a test application

After the cluster is running, deploy a simple NGINX application to the user node pool.

### `test-app.yaml`

YAML

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-demo
  namespace: default
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx-demo
  template:
    metadata:
      labels:
        app: nginx-demo
    spec:
      nodeSelector:
        workload-type: application
      containers:
        - name: nginx
          image: nginx:1.27
          ports:
            - containerPort: 80
          resources:
            requests:
              cpu: 100m
              memory: 128Mi
            limits:
              cpu: 250m
              memory: 256Mi
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-demo
  namespace: default
spec:
  type: LoadBalancer
  selector:
    app: nginx-demo
  ports:
    - port: 80
      targetPort: 80
```

Deploy and test:

Bash

```
kubectl apply -f test-app.yaml

kubectl get pods -o wide

kubectl get svc nginx-demo -w
```

When Azure provisions the external LoadBalancer address, access the application using the assigned IP.

## 12. Production hardening checklist

### AKS production readiness

Track the security and reliability tasks.

0 / 8

Use a private AKS API endpoint where appropriate.

Configure Microsoft Entra ID and least-privilege RBAC.

Validate NSGs against AKS control-plane and node traffic requirements.

Use separate system and user node pools.

Configure availability zones and autoscaling where supported.

Enable Azure Monitor, logs, metrics, and alerting.

Configure backups and disaster-recovery procedures for stateful workloads.

Use remote Terraform state with locking and protected credentials.

### Important production notes

1. NSGs: Do not apply restrictive deny rules to AKS without validating cluster traffic. AKS may require specific network access for control-plane communication, DNS, health probes, and upgrades.

2. Application Gateway: The subnet is reserved in this starter project; an Application Gateway or ingress controller has not yet been deployed.

3. Private AKS: The cluster API endpoint in this example is not configured as private. A private cluster needs additional DNS and network access planning.

4. High availability: Three availability zones are configured in the node pools. Verify that the selected VM SKU and region support those zones.

5. Stateful workloads: For your Roboshop MySQL and MongoDB services, use persistent volumes, backups, and a tested restore procedure rather than relying only on node-pool redundancy.

## Official documentation

* Microsoft Learn — Deploy a production-ready AKS cluster with Terraform 

* Microsoft Learn — Azure CNI Overlay networking 

* Terraform Registry — Azure Kubernetes Service module 

* Terraform Registry — Azure NAT Gateway resource 

Next step: This starter configuration can be expanded into a full Roboshop AKS platform with a private cluster, Application Gateway Ingress Controller, Azure Container Registry, Key Vault, managed identities, and Terraform remote state.
