variable "project_name" {
  description = "The name of the project"
  type        = string  
  default     = "tf-roboshop"
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "tf-roboshop-rg"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "southindia"
}


variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
}