output "resource_group_name" { value = azurerm_resource_group.this.name }
output "vnet_id" { value = azurerm_virtual_network.this.id }
output "subnet_ids" { value = { for k, v in azurerm_subnet.subnets : k => v.id } }
output "subnet_names" { value = { for k, v in azurerm_subnet.subnets : k => v.name } }