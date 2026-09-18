Terraform
│
├── Resource Group
├── Network
│   ├── VNet
│   ├── Subnets
│   ├── NSG
│   └── Public IP
│
├── VM
│   └── Ubuntu
│
├── Bootstrap
│   ├── Docker
│   ├── Git
│   ├── Java
│   ├── Node.js
│   └── Python
│
└── Roboshop
    ├── MongoDB
    ├── MySQL
    ├── Redis
    ├── Catalogue
    ├── User
    ├── Cart
    ├── Frontend
    ├── Payment
    └── Dispatch



The particularly useful pattern for your project is:

# Network exports
output "subnet_id" {
  value = azurerm_subnet.this.id
}

↓

# Root passes it
subnet_id = module.network.subnet_id

↓

# VM receives it
variable "subnet_id" {
  type = string
}

↓

# VM consumes it
subnet_id = var.subnet_id


                                                 INTERNET
                            │
                            ▼
                ┌─────────────────────┐
                │ Application Gateway │
                │       / ALB         │
                └──────────┬──────────┘
                           │
                           ▼
                    ┌─────────────┐
                    │     AKS     │
                    │             │
                    │  Frontend   │
                    │  Catalogue  │
                    │  User       │
                    │  Cart       │
                    │  Payment    │
                    │  Dispatch   │
                    └──────┬──────┘
                           │
                           │ Private connection
                           ▼
                 ┌────────────────────┐
                 │ Azure DB for       │
                 │ MySQL/PostgreSQL   │
                 └────────────────────┘




terraform-azure-roboshop/
│
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
│
└── modules/
    ├── resource-group/
    ├── network/
    ├── aks/
    ├── application-gateway/
    └── database/




    Resource Group
      │
      ▼
    VNet
      │
 ┌────┴──────────────┐
 │                   │
 ▼                   ▼
AKS subnet       Database subnet
 │                   │
 ▼                   ▼
AKS              Azure DB
 │
 ▼
Application Gateway




