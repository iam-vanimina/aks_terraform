# 🚀 Terraform Azure Roboshop

Production-style Azure infrastructure for deploying the **Roboshop microservices platform** using **Terraform, Azure VNet, AKS, Application Gateway, and Azure Database for MySQL Flexible Server**.

The project demonstrates how to build reusable Terraform modules and pass infrastructure outputs between modules.

---

## 🏗️ Architecture

```text
                         ┌──────────────────┐
                         │     INTERNET     │
                         └────────┬─────────┘
                                  │
                                  ▼
                    ┌──────────────────────────┐
                    │  Azure Application       │
                    │  Gateway WAF v2          │
                    └────────────┬─────────────┘
                                 │
                                 ▼
              ┌────────────────────────────────────┐
              │               AKS                  │
              │                                    │
              │  ┌──────────┐   ┌──────────────┐  │
              │  │ Frontend │   │ Catalogue    │  │
              │  └──────────┘   └──────────────┘  │
              │                                    │
              │  ┌──────────┐   ┌──────────────┐  │
              │  │   User   │   │     Cart     │  │
              │  └──────────┘   └──────────────┘  │
              │                                    │
              │  ┌──────────┐   ┌──────────────┐  │
              │  │ Payment  │   │   Dispatch   │  │
              │  └──────────┘   └──────────────┘  │
              └────────────────┬───────────────────┘
                               │
                               │ Private Network
                               ▼
                    ┌──────────────────────────┐
                    │ Azure MySQL Flexible     │
                    │ Server                   │
                    └──────────────────────────┘


                    Azure Virtual Network
                       10.0.0.0/16
                              │
          ┌───────────────────┼────────────────────┐
          │                   │                    │
          ▼                   ▼                    ▼
   AKS Subnet           App Gateway Subnet    MySQL Subnet
   10.0.1.0/24          10.0.2.0/24           10.0.3.0/24
```

---

# 📁 Project Structure

```text
terraform-azure-roboshop/
│
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── .gitignore
│
└── modules/
    │
    ├── resource-group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── network/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── aks/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── application-gateway/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── database/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

# ☁️ Azure Resources

This project creates the following infrastructure:

* Azure Resource Group
* Azure Virtual Network
* AKS subnet
* Application Gateway subnet
* MySQL subnet
* Azure Kubernetes Service
* Application Gateway WAF v2
* Public IP
* Azure Database for MySQL Flexible Server
* Private DNS Zone
* Private DNS VNet Link

---

# 🧩 Terraform Module Architecture

The project follows Terraform's reusable module pattern.

```text
                    ROOT MODULE
                         │
                         ▼
                 Resource Group
                         │
                         ▼
                       VNet
                         │
             ┌───────────┼───────────┐
             │           │           │
             ▼           ▼           ▼
         AKS Subnet   AppGW Subnet  MySQL Subnet
             │           │           │
             ▼           ▼           ▼
            AKS       App Gateway   MySQL
```

Module outputs are passed into other modules using:

```hcl
module.network.aks_subnet_id
```

Example:

```hcl
module "aks" {
  source = "./modules/aks"

  aks_subnet_id = module.network.aks_subnet_id
}
```

---

# 🔄 Terraform Data Flow

The project demonstrates the following Terraform pattern:

```text
Module A
   │
   │ output
   ▼
Root Module
   │
   │ variable
   ▼
Module B
```

Example:

### Network module

```hcl
output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}
```

### Root module

```hcl
module "aks" {
  source = "./modules/aks"

  aks_subnet_id = module.network.aks_subnet_id
}
```

### AKS module

```hcl
variable "aks_subnet_id" {
  type = string
}
```

This keeps the modules loosely coupled and reusable.

---

# 🔧 Prerequisites

Install the following tools:

### Azure CLI

```bash
az version
```

### Terraform

```bash
terraform version
```

### kubectl

```bash
kubectl version --client
```

You also need:

* An Azure subscription
* Azure CLI authentication
* Sufficient Azure quota for AKS
* An available Azure region

---

# 🔐 Azure Login

Login:

```bash
az login
```

Check subscriptions:

```bash
az account list -o table
```

Select your subscription:

```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

Verify:

```bash
az account show
```

---

# ⚙️ Terraform Provider

Example `provider.tf`:

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
```

---

# 📝 Configuration

Create:

```text
terraform.tfvars
```

Example:

```hcl
mysql_admin_password = "CHANGE-ME"
```

Never commit real credentials to GitHub.

Recommended `.gitignore`:

```text
.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
crash.log
override.tf
override.tf.json
*_override.tf
*_override.tf.json
```

---

# 🚀 Deployment

## 1. Initialize Terraform

```bash
terraform init
```

---

## 2. Format Terraform

```bash
terraform fmt -recursive
```

---

## 3. Validate

```bash
terraform validate
```

Expected:

```text
Success! The configuration is valid.
```

---

## 4. Create Execution Plan

```bash
terraform plan
```

Review the resources before deployment.

---

## 5. Deploy

```bash
terraform apply
```

Confirm:

```text
yes
```

---

# ☸️ Connect to AKS

After Terraform creates the cluster:

```bash
az aks get-credentials \
  --resource-group roboshop-rg \
  --name roboshop-aks
```

Verify the context:

```bash
kubectl config current-context
```

Check nodes:

```bash
kubectl get nodes
```

Example:

```text
NAME                                STATUS   ROLES    AGE
aks-system-xxxxxxxx-vmss000000      Ready    <none>   5m
aks-system-xxxxxxxx-vmss000001      Ready    <none>   5m
```

---

# 🔍 Check AKS

```bash
kubectl get nodes -o wide
```

```bash
kubectl get pods -A
```

```bash
kubectl get namespaces
```

---

# 🌐 Application Gateway

Get the Application Gateway public IP:

```bash
terraform output application_gateway_public_ip
```

Example:

```text
20.x.x.x
```

You can then test:

```bash
curl http://<APPLICATION-GATEWAY-IP>
```

The Kubernetes ingress/application configuration must subsequently connect the gateway to the desired Roboshop services.

---

# 🗄️ MySQL

Get the MySQL server FQDN:

```bash
terraform output mysql_server_fqdn
```

Example:

```text
roboshop-mysql-server.mysql.database.azure.com
```

Database:

```bash
terraform output mysql_database
```

Expected:

```text
roboshop
```

The MySQL server is deployed into the delegated database subnet and uses private DNS integration.

---

# 🔐 Security Design

The project separates network resources:

```text
Internet
   │
   ▼
Application Gateway
   │
   ▼
AKS
   │
   ▼
Private MySQL
```

The database is not intended to be directly exposed to the public Internet.

Recommended production improvements:

* Azure Key Vault
* Managed identities
* Workload Identity
* Private AKS cluster
* Private Application Gateway configuration
* Azure Firewall
* Network Security Groups
* Azure Monitor
* Microsoft Defender for Cloud
* TLS/HTTPS
* Container image scanning
* RBAC
* Azure Policy

---

# 🔑 Secrets

Avoid:

```hcl
mysql_admin_password = "MyPassword123"
```

inside source-controlled Terraform files.

For a production implementation, use:

```text
Azure Key Vault
       │
       ▼
Terraform / Workload Identity
       │
       ▼
Azure Database
```

You can also provide sensitive Terraform variables through environment variables:

```bash
export TF_VAR_mysql_admin_password="YOUR_PASSWORD"
```

On Windows PowerShell:

```powershell
$env:TF_VAR_mysql_admin_password="YOUR_PASSWORD"
```

---

# 📤 Terraform Outputs

The project exposes useful infrastructure information:

```bash
terraform output
```

Examples:

```text
resource_group_name
vnet_id
aks_cluster_name
aks_oidc_issuer_url
application_gateway_public_ip
mysql_server_fqdn
mysql_database
```

---

# 🧪 Useful Commands

### Terraform

```bash
terraform fmt -recursive
```

```bash
terraform validate
```

```bash
terraform plan
```

```bash
terraform apply
```

```bash
terraform output
```

Show state:

```bash
terraform state list
```

Show a resource:

```bash
terraform state show <RESOURCE>
```

---

# ☸️ Kubernetes Commands

```bash
kubectl get nodes
```

```bash
kubectl get pods -A
```

```bash
kubectl get svc -A
```

```bash
kubectl get ingress -A
```

```bash
kubectl describe node <NODE>
```

```bash
kubectl describe pod <POD>
```

---

# 🧹 Destroy Infrastructure

**Warning:** this deletes the Terraform-managed infrastructure.

```bash
terraform destroy
```

Confirm:

```text
yes
```

---

# 📚 Learning Objectives

This project demonstrates:

### Terraform

* Terraform modules
* Variables
* Outputs
* Module dependencies
* Resource dependencies
* State management
* Sensitive variables
* Infrastructure as Code

### Azure

* Resource Groups
* VNets
* Subnets
* AKS
* Application Gateway
* WAF
* Public IP
* Private DNS
* MySQL Flexible Server
* Managed identities

### Kubernetes

* AKS
* Nodes
* Pods
* Services
* Ingress
* Namespaces
* Kubernetes application deployment

### DevOps

```text
Terraform
    ↓
Azure Infrastructure
    ↓
AKS
    ↓
Kubernetes
    ↓
Roboshop Microservices
    ↓
Application Gateway
    ↓
Users
```

---

# 🔮 Future Improvements

Planned enhancements:

* [ ] Azure Key Vault
* [ ] AKS Workload Identity
* [ ] Azure Application Gateway Ingress integration
* [ ] HTTPS/TLS certificates
* [ ] Azure Monitor
* [ ] Container Insights
* [ ] Prometheus
* [ ] Grafana
* [ ] OpenTelemetry
* [ ] Argo CD
* [ ] GitHub Actions
* [ ] Terraform remote state
* [ ] Azure Storage backend
* [ ] Terraform CI/CD
* [ ] Trivy image scanning
* [ ] SonarQube
* [ ] Network Security Groups
* [ ] Private AKS
* [ ] Azure Policy
* [ ] Autoscaling
* [ ] HPA
* [ ] Cluster Autoscaler

---

# 🎯 End-to-End Roboshop Platform

The completed target architecture is:

```text
                         GitHub
                           │
                           ▼
                    GitHub Actions
                           │
                           ▼
                       Terraform
                           │
                           ▼
                    ┌─────────────┐
                    │    Azure    │
                    └──────┬──────┘
                           │
          ┌────────────────┼─────────────────┐
          │                │                 │
          ▼                ▼                 ▼
         VNet             AKS          Azure MySQL
          │                │                 │
     ┌────┼────┐           │                 │
     │    │    │           │                 │
     ▼    ▼    ▼           ▼                 │
    AKS  AppGW MySQL   Roboshop Apps          │
   Subnet Subnet Subnet                       │
                         │                    │
                         └────────────────────┘
                                  │
                                  ▼
                           Application Data
```

---

# 👨‍💻 Author

**Venkata Ram Vanimina**

Cloud | DevOps | Kubernetes | Terraform | AWS | Azure

---

# ⭐ Project Goals

The purpose of this project is to demonstrate a complete Infrastructure-as-Code implementation for a cloud-native microservices platform using reusable Terraform modules.

```text
Resource Group
      ↓
VNet
      ↓
Subnets
      ↓
AKS
      ↓
Application Gateway
      ↓
Roboshop
      ↓
Azure MySQL
```

This architecture can be extended with CI/CD, GitOps, observability, security scanning, and production-grade Azure governance.
