variable "default_count" {
    type = number
    description = "Node count to be used in AKS cluster"
}
variable "vm_size" {
    type = string
    description = "The VM Size in which you need choose for your VM."
}

#variable "ssh_public_key" {
#    default = "~/.ssh/id_rsa.pub"
#}

variable "dns_prefix" {
    type = string
    description = "DNS name to used in AKS cluster"
}

variable cluster_name {
    type = string
    description = "AKS Name to be used in AKS Cluster"
}

variable resource_group_name {
    type = string
    description = "Resource Group name to used for AKS Cluster"
}

variable location {
    type = string
    description = "Location where AKS cluster will be deployed"
}

variable log_analytics_workspace_name {
    type = string
    description = "Log Analyst Workspace Name"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    type = string
    description = "Local where Log Analytcs will be deployed"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    type = string
    description = "SKU will be used for Log Analytics Workspace"
}