variable "workspace_name" { type = string }
variable "location" { type = string }
variable "rg_name" { type = string }
variable "retention_in_days" { 
  type = number
  default = 30 
}
variable "tags" { type = map(string) }
variable "aks_resource_id" {
  type = string
  default = "" 
}
variable "sql_server_id" { 
  type = string
  default = "" 
}
variable "enable_aks" {
  type = bool
  default = false
}
variable "enable_sql" { 
  type = bool
  default = false
}
variable "env" { type = string }
