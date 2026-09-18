variable "vm_id" {
  type = string
}

variable "vm_ip" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}