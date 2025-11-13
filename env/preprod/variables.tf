variable "project_name" { type = string }
variable "env" { type = string }
variable "location" { type = string }
variable "tenant_id" { type = string }
variable "object_id_for_access" { type = string }
variable "extra_tags" { 
  type = map(string)
  default = {} 
}


# network specifics
variable "rg_name" { type = string }
variable "vnet_name" { type = string }
variable "address_space" { type = list(string) }
variable "subnet_names" { type = map(string) }
variable "subnet_cidrs" { type = map(string) }

# AKS
variable "enable_aks" { 
  type = bool
  default = true
}
variable "aks_node_count" { 
  type = number
  default = 1
}
variable "aks_vm_size" { 
  type = string
  default = "Standard_B4ms"
}

# SQL
variable "enable_sql" { 
  type = bool
  default = true
}
variable "sql_admin_login" { type = string }
variable "sql_admin_password" { type = string }

# monitoring
variable "retention_in_days" { 
  type = number
  default = 30
}
