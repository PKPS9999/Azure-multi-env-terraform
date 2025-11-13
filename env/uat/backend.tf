terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstate<unique>"
    container_name       = "tfstate"
    key                  = "<env>.terraform.tfstate"
  }
}
