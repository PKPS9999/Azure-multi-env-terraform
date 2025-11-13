resource "azurerm_log_analytics_workspace" "this" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}

resource "azurerm_monitor_diagnostic_setting" "aks_diag" {
  count                      = var.enable_aks ? 1 : 0
  name                       = "diag-aks-${var.env}"
  target_resource_id         = var.aks_resource_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  enabled_metric {
    category = "AllMetrics"
  }
}


resource "azurerm_monitor_diagnostic_setting" "sql_diag" {
  count                      = var.enable_sql ? 1 : 0
  name                       = "diag-sql-${var.env}"
  target_resource_id         = var.sql_server_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id

  enabled_metric {
    category = "AllMetrics"
  }
  
}
