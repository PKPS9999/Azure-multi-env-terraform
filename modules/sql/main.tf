resource "azurerm_mssql_server" "this" {
  name                         = var.sql_server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password
  version                      = "12.0"
  tags                         = var.tags
}

resource "azurerm_mssql_database" "this" {
  server_id = azurerm_mssql_server.this.id
  name                = var.db_name
  sku_name            = var.sku_name
  max_size_gb         = 10
  tags                = var.tags
}

resource "azurerm_private_endpoint" "sql_pe" {
  name                = "pe-${var.db_name}"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "sql-psc"
    private_connection_resource_id = azurerm_mssql_server.this.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  tags = var.tags
}