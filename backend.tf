terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate6388RG"
    storage_account_name = "tfstate6388sa"
    container_name       = "tfstatefiles"
    key                  = "ZVID2BY5NDcMdBHXnoCepDAGVOo6Cm6mYfUXW20lhg4JGTaCBG9/1DtQRxQzcPzPlp4QdOdifOL4+AStpNuQpw=="
  }
}
