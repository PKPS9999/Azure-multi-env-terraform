resource "azurerm_resource_group" "this" {
name = var.rg_name
location = var.location
tags = var.tags
}


resource "azurerm_virtual_network" "this" {
name = var.vnet_name
location = azurerm_resource_group.this.location
resource_group_name = azurerm_resource_group.this.name
address_space = var.address_space
tags = var.tags
}


resource "azurerm_subnet" "subnets" {
for_each = var.subnet_names
name = each.value
resource_group_name = azurerm_resource_group.this.name
virtual_network_name= azurerm_virtual_network.this.name
address_prefixes = [var.subnet_cidrs[each.key]]
}


resource "azurerm_virtual_network_peering" "to_hub" {
count = var.hub_vnet_id == "" ? 0 : 1
name = "peering-to-hub"
resource_group_name = azurerm_resource_group.this.name
virtual_network_name = azurerm_virtual_network.this.name
remote_virtual_network_id = var.hub_vnet_id
allow_forwarded_traffic = true
allow_gateway_transit = false
use_remote_gateways = false
}