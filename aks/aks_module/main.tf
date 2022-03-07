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

resource "azurerm_log_analytics_workspace" "test" {
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
    location            = var.log_analytics_workspace_location
    resource_group_name = azurerm_resource_group.k8s.name
    sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "test" {
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.test.location
    resource_group_name   = azurerm_resource_group.k8s.name
    workspace_resource_id = azurerm_log_analytics_workspace.test.id
    workspace_name        = azurerm_log_analytics_workspace.test.name

    plan {
        publisher = "Microsoft"
        product   = "OMSGallery/ContainerInsights"
    }
}

module "aks-nginx" {
  source = "/home/thiago/templates/modules/terraform-azurerm-aks-nginx-certmgr"

        PROJECT="alt"
        INSTANCE="2"
        ENVIRONMENT="dev"
        REGION="southcentralUS"
        AKS_SSH_ADMIN_KEY="ssh-rsa AAAAB3NzaC1yc-----@----.local"
        ADMIN_USER="adminuser"
        NODE_COUNT="1"
        NODE_SIZE="Standard_D2s_v3"
        K8S_HELM_HOME="/Users/evill_genius/.helm"
        K8S_KUBE_CONFIG="/Users/evill_genius/.kube/test1"
        K8S_VER="1.13.5"
        VNET_NAME="aks-vnet"
}