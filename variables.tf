variable "project_name" {
type = string
default = "infra-setup"
}


variable "location" {
type = string
default = local.default_location
}


variable "extra_tags" {
type = map(string)
default = {}
}