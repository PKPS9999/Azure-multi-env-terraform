project_name         = "infra-setup"
env                  = "dev"
location             = "eastus"
tenant_id            = "84e2b0e7-902b-41b8-9b12-c7ad70e19ae4"
object_id_for_access = "b00ec517-c5d3-42b6-9e13-d91d23bc3865"

# network
rg_name       = "rg-demoapp-dev"
vnet_name     = "vnet-demoapp-dev"
address_space = ["10.10.0.0/16"]
subnet_names  = { app = "snet-app", db = "snet-db", infra = "snet-infra" }
subnet_cidrs  = { app = "10.10.1.0/24", db = "10.10.2.0/24", infra = "10.10.3.0/24" }

# aks
enable_aks     = true
aks_node_count = 1
aks_vm_size    = "Standard_B2s"

# sql
enable_sql         = true
sql_admin_login    = "sqladmin"
sql_admin_password = "DevP@ssword123!"

# tags
extra_tags = {
  Environment = "dev"
  CostCenter  = "team-x"
}
