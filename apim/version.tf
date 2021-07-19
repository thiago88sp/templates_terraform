terraform {
    backend "azurerm" {}
    required_providers {
        azurerm =   {
            source  =   "hashicorp/azurerm"
            version =   ">= 2.23"
        }
    }
    required_version    =   ">= 0.13"
}
