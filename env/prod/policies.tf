data "azurerm_subscription" "current" {}

resource "azurerm_policy_assignment" "require_tags" {
  name                 = "require-environment-tag"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/requireTag"
  display_name         = "Require Environment tag"
  parameters = jsonencode({
    tagName = { value = "Environment" }
  })
}

resource "azurerm_policy_assignment" "allowed_locations" {
  name                 = "restrict-locations"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/allowedLocations"
  display_name         = "Allowed locations"
  parameters = jsonencode({
    listOfAllowedLocations = { value = ["eastus", "centralus"] }
  })
}

resource "azurerm_policy_assignment" "allowed_vm_skus" {
  name                 = "restrict-vm-skus"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/allowedVMSSkus"
  display_name         = "Allowed VM SKUs"
  parameters = jsonencode({
    listOfAllowedSKUs = { value = ["Standard_DS2_v2", "Standard_DS3_v2"] }
  })
}
