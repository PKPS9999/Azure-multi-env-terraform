variable "kv_name" { type = string }
variable "location" { type = string }
variable "rg_name" { type = string }
variable "tenant_id" { type = string }
variable "object_id_for_access" { type = string }
variable "create_sample_secret" {
  type    = bool
  default = false
}

variable "sample_secret_value" {
  type    = string
  default = ""
}
variable "tags" { type = map(string) }