locals {
  tags = merge({ Project = var.project_name, Environment = var.env }, var.extra_tags)
}

# Network
module "network" {
  source        = "../../modules/network"
  rg_name       = var.rg_name
  location      = var.location
  vnet_name     = var.vnet_name
  address_space = var.address_space
  subnet_names  = var.subnet_names
  subnet_cidrs  = var.subnet_cidrs
  tags          = local.tags
  hub_vnet_id   = var.hub_vnet_id.id
}

# AKS (optional)
module "aks" {
  source                    = "../../modules/aks"
  aks_name                  = "aks-${var.project_name}-${var.env}"
  location                  = var.location
  rg_name                   = module.network.resource_group_name
  dns_prefix                = "${var.project_name}-${var.env}"
  node_count                = var.aks_node_count
  vm_size                   = var.aks_vm_size
  tags                      = local.tags
  enable_oms                = true
  log_analytics_workspace_id = ""
}

# SQL (optional) — place DB in infra subnet (or db subnet)
module "sql" {
  source         = "../../modules/sql"
  sql_server_name = "sqlsrv-${var.project_name}-${var.env}"
  db_name        = "sqldb-${var.project_name}-${var.env}"
  rg_name        = module.network.resource_group_name
  location       = var.location
  admin_login    = var.sql_admin_login
  admin_password = var.sql_admin_password
  sku_name       = "GP_Gen5_2"
  subnet_id      = module.network.subnet_ids["db"]
  tags           = local.tags
}

# Key Vault
module "keyvault" {
  source = "../../modules/keyvault"
  kv_name = "kv-${var.project_name}-${var.env}"
  location = var.location
  rg_name  = module.network.resource_group_name
  tenant_id = var.tenant_id
  object_id_for_access = var.object_id_for_access
  create_sample_secret = true
  sample_secret_value  = var.sql_admin_password
  tags = local.tags
}

# Monitoring
module "monitoring" {
  source = "../../modules/monitoring"
  workspace_name = "law-${var.project_name}-${var.env}"
  location = var.location
  rg_name = module.network.resource_group_name
  retention_in_days = var.retention_in_days
  tags = local.tags
  aks_resource_id = try(module.aks.aks_id, "")
  sql_server_id   = try(module.sql.sql_server_id, "")
  enable_aks = var.enable_aks
  enable_sql = var.enable_sql
  env = var.env
}

# Optionally pass workspace id into AKS addon after it's created (two-pass wiring) - not required here

output "vnet_id" { value = module.network.vnet_id }
output "aks_id" { value = try(module.aks.aks_id, "") }
output "sql_server_id" { value = try(module.sql.sql_server_id, "") }
output "log_workspace_id" { value = module.monitoring.log_analytics_workspace_id }
