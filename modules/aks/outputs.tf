output "aks_id" { value = azurerm_kubernetes_cluster.this.id }
output "aks_kube_admin_config_raw" {
  value = azurerm_kubernetes_cluster.this.kube_admin_config_raw
  description = "Base64-encoded admin kubeconfig (sensitive)"
}
