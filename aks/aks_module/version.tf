terraform {
    #backend "azurerm" {}
    backend "local" {
    path = "/home/thiago/templates/aks/aks_module/terraform.tfstate"
    }
    required_providers {
        azurerm =   {
            source  =   "hashicorp/azurerm"
            version =   ">= 2.23"
        }
    }
    required_version    =   ">= 0.13"
}
