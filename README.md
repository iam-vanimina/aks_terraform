# aks_terraform

<img width="1536" height="1024" alt="aks_terra" src="https://github.com/user-attachments/assets/652d82d8-566b-4e9a-9071-f6bb1e1a0661" />


<img width="1899" height="943" alt="image" src="https://github.com/user-attachments/assets/d4056b94-b9b4-4f93-bb35-71767b49f0ec" />

<img width="957" height="408" alt="Screenshot 2026-09-18 110413" src="https://github.com/user-attachments/assets/5cb1c5d7-03da-438d-8645-b208d07b722e" />



# Terraform Azure AKS Cluster

This project provisions an **Azure Kubernetes Service (AKS)** cluster on Microsoft Azure using **Terraform**.

The infrastructure is created using Infrastructure as Code (IaC), making the AKS environment reproducible, version-controlled, and easy to manage.

## 🏗️ Architecture

```text
                    ┌──────────────────────┐
                    │       Developer      │
                    │   Terraform / Git    │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │    Azure Resource    │
                    │        Group         │
                    └──────────┬───────────┘
                               │
                 ┌─────────────┴─────────────┐
                 │                           │
                 ▼                           ▼
        ┌─────────────────┐         ┌─────────────────┐
        │  Azure VNet     │         │  AKS Cluster    │
        │                 │         │                 │
        │  Subnet         │────────▶│ Control Plane   │
        │                 │         │                 │
        └─────────────────┘         │ Worker Nodes    │
                                    │                 │
                                    └────────┬────────┘
                                             │
                                             ▼
                                    ┌─────────────────┐
                                    │ Kubernetes Apps │
                                    └─────────────────┘
```

## 🚀 Technologies Used

* **Terraform**
* **Microsoft Azure**
* **Azure Kubernetes Service (AKS)**
* **Azure Resource Group**
* **Azure Virtual Network**
* **Azure Subnet**
* **Azure Container Registry (optional)**
* **Azure CLI**
* **Git / GitHub**
* **Kubernetes**

## 📁 Project Structure

```text
terraform-aks/
│
├── README.md
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── resource-group.tf
├── network.tf
├── aks.tf
├── outputs.tf
├── versions.tf
├── .gitignore
└── modules/
```

For a simple project, the Terraform configuration can also be maintained without modules.

---

# 🔧 Prerequisites

Install the following tools:

### Azure CLI

Verify:

```bash
az version
```

Login:

```bash
az login
```

Check the subscription:

```bash
az account show
```

If you have multiple subscriptions:

```bash
az account list
```

Set the required subscription:

```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

### Terraform

Verify:

```bash
terraform version
```

### kubectl

Verify:

```bash
kubectl version --client
```

---

# 🔐 Azure Authentication

Login to Azure:

```bash
az login
```

Verify:

```bash
az account show
```

Terraform will use the Azure credentials available through the Azure CLI for local development.

For CI/CD pipelines, use a more controlled authentication method such as an Azure service principal or workload identity/OIDC.

---

# 📌 Terraform Configuration

## versions.tf

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
```

## provider.tf

```hcl
provider "azurerm" {
  features {}
}
```

---

# 📦 Variables

## variables.tf

```hcl
variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-terraform-aks"
}

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-terraform-demo"
}

variable "node_count" {
  description = "Number of AKS worker nodes"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "AKS node VM size"
  type        = string
  default     = "Standard_D2s_v5"
}
```

---

# 🏢 Resource Group

## resource-group.tf

```hcl
resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = "dev"
    Project     = "terraform-aks"
    ManagedBy   = "Terraform"
  }
}
```

---

# 🌐 Azure Network

## network.tf

```hcl
resource "azurerm_virtual_network" "aks" {
  name                = "vnet-aks"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  address_space = ["10.10.0.0/16"]

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_subnet" "aks" {
  name                 = "snet-aks"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.aks.name

  address_prefixes = ["10.10.1.0/24"]
}
```

---

# ☸️ AKS Cluster

## aks.tf

```hcl
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "aks-terraform"

  default_node_pool {
    name           = "system"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = azurerm_subnet.aks.id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = "dev"
    Project     = "terraform-aks"
    ManagedBy   = "Terraform"
  }
}
```

---

# 📤 Terraform Outputs

## outputs.tf

```hcl
output "resource_group_name" {
  value = azurerm_resource_group.aks.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}
```

---

# ⚙️ terraform.tfvars

Create:

```text
terraform.tfvars
```

Example:

```hcl
location            = "Central India"
resource_group_name = "rg-terraform-aks"
aks_name            = "aks-terraform-demo"
node_count          = 2
vm_size             = "Standard_D2s_v5"
```

> Do not commit secrets, credentials, service-principal keys, or sensitive Terraform variable files to GitHub.

---

# 🚀 Deploy AKS

Initialize Terraform:

```bash
terraform init
```

Format the configuration:

```bash
terraform fmt -recursive
```

Validate:

```bash
terraform validate
```

Create an execution plan:

```bash
terraform plan
```

Apply the infrastructure:

```bash
terraform apply
```

Enter:

```text
yes
```

Terraform will create:

```text
Azure Resource Group
        ↓
Azure VNet
        ↓
AKS Subnet
        ↓
AKS Cluster
        ↓
AKS Worker Nodes
```

---

# 🔍 Verify Azure Resources

Check resource groups:

```bash
az group list -o table
```

Check AKS:

```bash
az aks list -o table
```

Check cluster:

```bash
az aks show \
  --resource-group rg-terraform-aks \
  --name aks-terraform-demo
```

---

# ☸️ Connect to AKS

Download the Kubernetes credentials:

```bash
az aks get-credentials \
  --resource-group rg-terraform-aks \
  --name aks-terraform-demo
```

Verify the context:

```bash
kubectl config current-context
```

Check nodes:

```bash
kubectl get nodes
```

Expected:

```text
NAME                                STATUS   ROLES    AGE   VERSION
aks-system-xxxxxxxx-vmss000000      Ready    <none>   ...   v1.xx.x
aks-system-xxxxxxxx-vmss000001      Ready    <none>   ...   v1.xx.x
```

Check all namespaces:

```bash
kubectl get pods -A
```

---

# 🧪 Deploy a Test Application

Create an NGINX deployment:

```bash
kubectl create deployment nginx --image=nginx
```

Check:

```bash
kubectl get deployment
```

Check pods:

```bash
kubectl get pods
```

Expose the application:

```bash
kubectl expose deployment nginx \
  --type=LoadBalancer \
  --port=80
```

Check the service:

```bash
kubectl get svc nginx
```

Wait for the Azure Load Balancer external IP:

```text
NAME    TYPE           CLUSTER-IP     EXTERNAL-IP      PORT(S)
nginx   LoadBalancer   10.x.x.x       xx.xx.xx.xx      80:xxxxx/TCP
```

Access:

```text
http://<EXTERNAL-IP>
```

---

# 📊 Useful Kubernetes Commands

### Nodes

```bash
kubectl get nodes -o wide
```

### Pods

```bash
kubectl get pods -A
```

### Services

```bash
kubectl get svc -A
```

### Deployments

```bash
kubectl get deployments -A
```

### Namespaces

```bash
kubectl get namespaces
```

### Cluster information

```bash
kubectl cluster-info
```

---

# 🔄 Terraform Workflow

The recommended Terraform workflow is:

```text
                GitHub
                   │
                   ▼
              Terraform Code
                   │
                   ▼
             terraform init
                   │
                   ▼
             terraform validate
                   │
                   ▼
              terraform plan
                   │
                   ▼
             terraform apply
                   │
                   ▼
               Azure AKS
                   │
                   ▼
              Kubernetes
```

---

# 🧹 Destroy Infrastructure

When the lab is no longer required:

```bash
terraform destroy
```

Confirm:

```text
yes
```

This removes the infrastructure managed by Terraform.

> Destroying AKS also removes workloads running on that cluster. Make sure anything important is backed up before running `terraform destroy`.

---

# 🔒 .gitignore

Create `.gitignore`:

```gitignore
# Terraform
.terraform/
*.tfstate
*.tfstate.*
crash.log
crash.*.log

# Terraform variable files
*.tfvars
*.tfvars.json

# Override files
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# CLI configuration
.terraformrc
terraform.rc

# Secrets
*.pem
*.key
*.pfx

# OS
.DS_Store
Thumbs.db
```

Do **not** commit:

```text
terraform.tfstate
terraform.tfstate.backup
*.tfvars
service-principal credentials
client secrets
private keys
```

---

# 🔐 Production Improvements

For a production AKS implementation, consider adding:

* Azure Storage Account backend for Terraform state
* State locking
* Azure Key Vault
* Managed identities
* Azure Monitor
* Log Analytics
* Microsoft Entra ID integration
* Azure Policy
* Network policies
* Private AKS cluster
* Multiple node pools
* Cluster autoscaler
* Workload identity
* Azure Container Registry
* Ingress Controller
* TLS certificates
* OpenTelemetry
* Prometheus
* Grafana
* GitHub Actions / Azure DevOps CI/CD

---

# 🗄️ Remote Terraform State

For team environments, store Terraform state remotely instead of keeping it locally.

Example backend:

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstateaksdemo"
    container_name       = "tfstate"
    key                  = "aks.terraform.tfstate"
  }
}
```

The storage account and container should be created separately before initializing this backend.

Then:

```bash
terraform init
```

---

# 🔁 CI/CD Integration

A production workflow can be:

```text
Developer
   │
   ▼
Git Push
   │
   ▼
GitHub
   │
   ▼
GitHub Actions / Azure DevOps
   │
   ├── terraform fmt
   ├── terraform validate
   ├── terraform plan
   │
   ▼
Approval
   │
   ▼
terraform apply
   │
   ▼
Azure AKS
   │
   ▼
Argo CD
   │
   ▼
Kubernetes Applications
```

Terraform manages the **infrastructure**, while Argo CD can manage the **Kubernetes application deployments**.

---

# 📚 What This Project Demonstrates

This project demonstrates practical experience with:

* Infrastructure as Code
* Terraform
* Azure Resource Management
* Azure Kubernetes Service
* Azure networking
* Kubernetes cluster provisioning
* Managed identities
* Terraform variables and outputs
* Terraform state
* Remote state management
* Kubernetes administration
* Git/GitHub workflow
* CI/CD infrastructure automation
* Production-oriented AKS design

---

# 👨‍💻 Author

**Venkat**

DevOps / Cloud Engineer

Technologies:

```text
AWS | Azure | Terraform | Kubernetes | Docker
Jenkins | GitHub | Helm | Argo CD
Prometheus | Grafana | Loki | OpenTelemetry
```

---

# ⭐ Future Enhancements

Planned improvements:

```text
☑ Terraform AKS
☑ Azure VNet
☑ Kubernetes
☐ Azure Container Registry
☐ Terraform Remote Backend
☐ Multiple AKS Node Pools
☐ Cluster Autoscaler
☐ Azure Monitor
☐ Prometheus + Grafana
☐ Loki
☐ OpenTelemetry + Tempo
☐ Argo CD
☐ GitHub Actions / Azure DevOps
☐ Application Deployment
```

---

## License

This project is intended for learning, demonstration, and DevOps portfolio purposes.
