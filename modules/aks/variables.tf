variable "aks_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "node_count" {
  type    = number
  default = 1
}

variable "vm_size" {
  type    = string
  default = "Standard_B4ms"
}

variable "tags" {
  type = map(string)
}

variable "enable_oms" {
  type    = bool
  default = false
}

variable "log_analytics_workspace_id" {
  type    = string
  default = ""
}
