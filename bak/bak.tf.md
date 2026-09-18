Here’s a **GitHub-ready Terraform example** to create an **Azure Network Security Group (NSG)** with inbound/outbound rules and associate it with a subnet.

### Architecture

```text
Internet
   |
   v
+------------------+
| Azure VNet       |
| 10.0.0.0/16      |
|                  |
| +--------------+ |
| | Web Subnet   | |
| | 10.0.1.0/24  | |
| |              | |
| | NSG          | |
| |              | |
| | Allow 80     | |
| | Allow 443    | |
| | Allow SSH    | |
| | Deny All     | |
| +--------------+ |
+------------------+
```

### Project structure

```text
azure-nsg-terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```

### `main.tf`

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

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

# Subnet
resource "azurerm_subnet" "web" {
  name                 = "web-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Security Group
resource "azurerm_network_security_group" "web_nsg" {
  name                = "web-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# Allow SSH
resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "Allow-SSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = var.admin_source_ip
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

# Allow HTTP
resource "azurerm_network_security_rule" "allow_http" {
  name                        = "Allow-HTTP"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

# Allow HTTPS
resource "azurerm_network_security_rule" "allow_https" {
  name                        = "Allow-HTTPS"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

# Allow outbound HTTPS
resource "azurerm_network_security_rule" "allow_outbound_https" {
  name                        = "Allow-Outbound-HTTPS"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.web_nsg.name
}

# Associate NSG with subnet
resource "azurerm_subnet_network_security_group_association" "web" {
  subnet_id                 = azurerm_subnet.web.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id
}
```

### `variables.tf`

```hcl
variable "resource_group_name" {
  description = "Azure Resource Group name"
  type        = string
  default     = "tf-nsg-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "tf-vnet"
}

variable "admin_source_ip" {
  description = "Public IP/CIDR allowed to SSH"
  type        = string
}
```

### `terraform.tfvars`

Replace the IP with **your public IP**.

```hcl
resource_group_name = "tf-nsg-rg"
location            = "Central India"
vnet_name           = "tf-vnet"

admin_source_ip = "YOUR_PUBLIC_IP/32"
```

For example:

```hcl
admin_source_ip = "203.0.113.10/32"
```

Don't use `0.0.0.0/0` for SSH in a real environment.

### `outputs.tf`

```hcl
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.web.name
}

output "nsg_name" {
  value = azurerm_network_security_group.web_nsg.name
}

output "nsg_id" {
  value = azurerm_network_security_group.web_nsg.id
}
```

### Deploy

```bash
az login

az account show

terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
```

Check the NSG:

```bash
az network nsg show \
  --resource-group tf-nsg-rg \
  --name web-nsg
```

List rules:

```bash
az network nsg rule list \
  --resource-group tf-nsg-rg \
  --nsg-name web-nsg \
  -o table
```

### Important NSG rule concepts

| Property                     | Example       | Meaning                          |
| ---------------------------- | ------------- | -------------------------------- |
| `priority`                   | `100`         | Lower number evaluated first     |
| `direction`                  | `Inbound`     | Traffic entering resource/subnet |
| `access`                     | `Allow`       | Allow or deny traffic            |
| `protocol`                   | `Tcp`         | TCP/UDP/`*`                      |
| `source_port_range`          | `*`           | Source port                      |
| `destination_port_range`     | `22`          | Destination port                 |
| `source_address_prefix`      | `10.0.0.0/16` | Source network                   |
| `destination_address_prefix` | `*`           | Destination network              |

One important point: **NSGs have Azure default rules**. You normally don't need to create a custom `Deny-All` rule because Azure already has default deny inbound behavior after the default allows.

For production, a better pattern is:

```text
Internet
   |
   v
Azure Load Balancer / Application Gateway
   |
   v
Web NSG
   |
   v
Web Subnet
   |
   v
App NSG
   |
   v
App Subnet
   |
   v
DB NSG
   |
   v
Database Subnet
```

This lets you restrict traffic such as **Internet → Web : 80/443**, **Web → App : 8080**, and **App → DB : 3306** rather than exposing every port broadly.

