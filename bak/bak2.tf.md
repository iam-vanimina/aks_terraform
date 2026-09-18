Yes — for **AKS**, the recommended Terraform design is to create an NSG and associate it with the **AKS node subnet**, while keeping AKS-managed networking in mind.

### AKS + NSG architecture

```text
                    Internet
                       |
                Azure Load Balancer
                       |
                 80 / 443
                       |
              +----------------+
              | AKS Node NSG   |
              +----------------+
                       |
              +----------------+
              | AKS Subnet     |
              | 10.10.1.0/24  |
              +----------------+
                       |
        +--------------+--------------+
        |              |              |
     Node 1          Node 2         Node 3
        |              |              |
     Pod 1/2         Pod 3/4        Pod 5/6
```

## 1. `main.tf`

```hcl
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# -------------------------
# Resource Group
# -------------------------
resource "azurerm_resource_group" "aks" {
  name     = "aks-terraform-rg"
  location = "Central India"
}

# -------------------------
# Virtual Network
# -------------------------
resource "azurerm_virtual_network" "aks" {
  name                = "aks-vnet"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  address_space = ["10.10.0.0/16"]
}

# -------------------------
# AKS Node Subnet
# -------------------------
resource "azurerm_subnet" "aks_nodes" {
  name                 = "aks-node-subnet"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks.name

  address_prefixes = ["10.10.1.0/24"]
}

# -------------------------
# AKS NSG
# -------------------------
resource "azurerm_network_security_group" "aks_nodes" {
  name                = "aks-node-nsg"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# -------------------------
# Allow HTTPS
# -------------------------
resource "azurerm_network_security_rule" "allow_https" {
  name                        = "Allow-HTTPS"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range      = "*"
  destination_port_range = "443"

  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.aks.name
  network_security_group_name = azurerm_network_security_group.aks_nodes.name
}

# -------------------------
# Allow HTTP
# -------------------------
resource "azurerm_network_security_rule" "allow_http" {
  name                        = "Allow-HTTP"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range      = "*"
  destination_port_range = "80"

  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.aks.name
  network_security_group_name = azurerm_network_security_group.aks_nodes.name
}

# -------------------------
# Allow NodePort range
# -------------------------
resource "azurerm_network_security_rule" "allow_nodeport" {
  name                        = "Allow-NodePort"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"

  source_port_range      = "*"
  destination_port_range = "30000-32767"

  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.aks.name
  network_security_group_name = azurerm_network_security_group.aks_nodes.name
}

# -------------------------
# Associate NSG with AKS subnet
# -------------------------
resource "azurerm_subnet_network_security_group_association" "aks" {
  subnet_id = azurerm_subnet.aks_nodes.id

  network_security_group_id = azurerm_network_security_group.aks_nodes.id
}
```

## 2. AKS cluster

Add this to `main.tf`:

```hcl
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "terraform-aks"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "terraform-aks"

  kubernetes_version = "1.33"

  default_node_pool {
    name           = "system"
    node_count     = 2
    vm_size        = "Standard_D2s_v5"
    vnet_subnet_id = azurerm_subnet.aks_nodes.id

    upgrade_settings {
      max_surge = "33%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_plugin_mode = "overlay"
    network_policy    = "azure"

    load_balancer_sku = "standard"
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}
```

### Important AKS point

Be careful with **custom NSG rules on an AKS subnet**. AKS requires certain node/control-plane and cluster networking traffic, and Azure/AKS can manage networking-related rules. An overly restrictive NSG can break:

* Node ↔ control-plane communication
* DNS
* Pod networking
* LoadBalancer/NodePort traffic
* Health probes
* Cluster upgrades
* Add-ons and Azure integrations

So don't start with a blanket deny rule such as:

```hcl
priority = 4096
access   = "Deny"
```

unless you've explicitly accounted for the AKS-required traffic.

## 3. Variables

```hcl
variable "location" {
  type    = string
  default = "Central India"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}
```

## 4. Outputs

```hcl
output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_subnet_id" {
  value = azurerm_subnet.aks_nodes.id
}

output "nsg_name" {
  value = azurerm_network_security_group.aks_nodes.name
}

output "resource_group" {
  value = azurerm_resource_group.aks.name
}
```

## 5. Deploy

```bash
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
```

Get AKS credentials:

```bash
az aks get-credentials \
  --resource-group aks-terraform-rg \
  --name terraform-aks
```

Verify:

```bash
kubectl get nodes

kubectl get pods -A
```

Check the NSG:

```bash
az network nsg rule list \
  --resource-group aks-terraform-rg \
  --nsg-name aks-node-nsg \
  -o table
```

### Production AKS NSG model

For a production cluster, I'd structure the rules around the actual application flows rather than simply opening ports:

```text
                    Internet
                       |
                  443 / 80
                       |
                Application Gateway
                       |
                +--------------+
                | AKS NSG      |
                +--------------+
                       |
              AKS Node Subnet
                       |
          +------------+------------+
          |                         |
       Frontend                   Backend
       80/443                    8080/8081
                                    |
                              Database subnet
                                    |
                               MySQL 3306
```

