variable "rg_name" { type = string }
variable "location" { type = string }
variable "vnet_name" { type = string }
variable "address_space" { type = list(string) }
variable "subnet_names" { type = map(string) }
variable "subnet_cidrs" { type = map(string) }
variable "tags" { type = map(string) }
variable "hub_vnet_id" { 
 type = string 
 default = ""
}