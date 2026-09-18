variable "cluster_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "aks_subnet_id" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = null
}

variable "node_vm_size" {
  type    = string
  default = "Standard_D2s_v5"
}

variable "node_count" {
  type    = number
  default = 2
}

variable "tags" {
  type = map(string)

  default = {
    project     = "roboshop"
    environment = "dev"
    managed_by  = "terraform"
  }
}

variable "service_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "dns_service_ip" {
  type    = string
  default = "10.10.0.10"
}