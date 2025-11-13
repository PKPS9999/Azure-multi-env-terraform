variable "sql_server_name" { type = string }
variable "db_name" { type = string }
variable "rg_name" { type = string }
variable "location" { type = string }
variable "admin_login" { type = string }
variable "admin_password" { type = string }
variable "sku_name" { 
  type = string
  default = "GP_Gen5_2"
}
variable "subnet_id" { type = string }
variable "tags" { type = map(string) }
