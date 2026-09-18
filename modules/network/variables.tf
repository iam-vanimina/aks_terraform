variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "aks_subnet_name" {
  type    = string
  default = "aks-subnet"
}

variable "aks_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "appgw_subnet_name" {
  type    = string
  default = "appgw-subnet"
}

variable "appgw_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "database_subnet_name" {
  type    = string
  default = "database-subnet"
}

variable "database_subnet_cidr" {
  type    = string
  default = "10.0.3.0/24"
}