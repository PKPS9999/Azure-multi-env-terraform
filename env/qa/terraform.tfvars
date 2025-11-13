project_name = "demoapp"
env          = "dev"
location     = "eastus"
tenant_id     = "<tenant-id>"
object_id_for_access = "<principal-object-id>"

# network
rg_name      = "rg-demoapp-dev"
vnet_name    = "vnet-demoapp-dev"
address_space = ["10.10.0.0/16"]
subnet_names = { app = "snet-app", db = "snet-db", infra = "snet-infra" }
subnet_cidrs = { app = "10.10.1.0/24", db = "10.10.2.0/24", infra = "10.10.3.0/24" }

# aks
enable_aks = true
aks_node_count = 1
aks_vm_size = "Standard_B2s"

# sql
enable_sql = true
sql_admin_login = "sqladmin"
sql_admin_password = "DevP@ssword123!"

# tags
extra_tags = {
  Environment = "dev"
  CostCenter  = "team-x"
}
