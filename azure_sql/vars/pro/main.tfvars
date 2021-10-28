default_count                   = 3
vm_size                         = "Standard_D2_v2"
dns_prefix                      = "aksonetrust"
cluster_name                    = "aksonetrust"
resource_group_name             = "aks_onetrust_rg"
location                        = "eastus"
log_analytics_workspace_name    = "aksonetrust-LAWorkspaceName"
log_analytics_workspace_location= "eastus"
#log_analytics_workspace_sku     = "PerGB2018"
log_analytics_workspace_sku     = "Standard"
vnet_name                       = "Spoke_BAM_Brazil"
routetable_id                   = "/subscriptions/f5175432-f15d-43f3-ad20-caa10fa48dd5/resourceGroups/Network_RG/providers/Microsoft.Network/routeTables/AKS_One_Trust_RT"





