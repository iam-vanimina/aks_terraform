variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vnet_id" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "database_name" {
  type    = string
  default = "roboshop"
}

variable "sku_name" {
  type    = string
  default = "B_Standard_B1ms"
}

variable "storage_size_gb" {
  type    = number
  default = 20
}

variable "tags" {
  type = map(string)

  default = {
    project     = "roboshop"
    environment = "dev"
    managed_by  = "terraform"
  }
}