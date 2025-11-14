resource "azurerm_key_vault" "this" {
  name                        = var.kv_name
  location                    = var.location
  resource_group_name         = var.rg_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id_for_access

    key_permissions    = ["Get", "List"]
    secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
  }

  tags = var.tags
}

resource "azurerm_key_vault_secret" "sample" {
  count        = var.create_sample_secret ? 1 : 0
  name         = "sample-secret"
  value        = var.sample_secret_value
  key_vault_id = azurerm_key_vault.this.id
}
