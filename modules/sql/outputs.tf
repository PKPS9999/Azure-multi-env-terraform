output "sql_server_id" { value = azurerm_mssql_server.this.id }
output "sql_db_id" { value = azurerm_mssql_database.this.id }
output "private_endpoint_id" { value = azurerm_private_endpoint.sql_pe.id }
