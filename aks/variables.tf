variable "vnet_address_space" {
  type    = string
  default = "10.0.0.0/16"
}

variable "aks_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"

}

variable "appgw_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "database_subnet_cidr" {
  type    = string
  default = "10.0.3.0/24"
}


variable "mysql_admin_username" {
  type    = string
  default = "roboshopadmin"
}

variable "mysql_admin_password" {
  type      = string
  sensitive = true
}