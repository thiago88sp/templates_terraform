provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "${var.PROJECT}${var.INSTANCE}${var.ENVIRONMENT}${random_integer.uuid.result}-rg"
  location = "${var.REGION}"

  tags {
    project = "${var.PROJECT}"
    instance = "${var.INSTANCE}"
    environment = "${var.ENVIRONMENT}"
  }
}

resource "random_integer" "uuid" { 
  min = 100
  max = 999
}

module "aks-nginx" {
  source = "/home/thiago/templates/modules/terraform-azurerm-aks-nginx-certmgr"

        PROJECT = var.project
        INSTANCE = var.instance
        ENVIRONMENT = var.environment
        REGION = var.Region
        AKS_SSH_ADMIN_KEY="ssh-rsa AAAAB3NzaC1yc-----@----.local"
        ADMIN_USER="adminuser"
        NODE_COUNT="1"
        NODE_SIZE = var.node_size
        K8S_HELM_HOME = var.K8S_HELM_HOME
        K8S_KUBE_CONFIG = var.K8S_KUBE_CONFIG
        K8S_VER = var.K8S_VER
        VNET_NAME="aks-vnet"
}