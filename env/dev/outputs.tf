output "resource_group" { value = module.network.resource_group_name }
output "subnet_ids" { value = module.network.subnet_ids }
output "key_vault_uri" { value = module.keyvault.key_vault_uri }