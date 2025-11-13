output "key_vault_id" { value = azurerm_key_vault.this.id }
output "key_vault_uri" { value = azurerm_key_vault.this.vault_uri }
output "sample_secret_id" {
  value       = azurerm_key_vault_secret.sample[0].id
  description = "ID of the sample secret created in the Key Vault"
    depends_on  = [azurerm_key_vault_secret.sample]
}