locals {
  rg_name        = var.use_default_names ? "rg-${substr(lower(var.environment), 0, 3)}-${lower(var.solution)}-${lookup(local.regions, lower(var.region))}-01" : var.rg_name
  resource_group = var.create_rg ? ["resource_group"] : []
  appgw_name        = var.use_default_names ? "appgw-${substr(lower(var.environment), 0, 3)}-${lower(var.solution)}-00${length(data.azurerm_resources.appgws.resources)+1}" : lower(var.appgw_name)
  default_tags = {
    deployedby  = "terraform"
    system      = "AppGateway"
    solution    = lower(var.solution)
    environment = lower(var.environment)
    region      = replace(lower(var.region), " ", "")
    create_date = formatdate("DD/MM/YY hh:mm", timeadd(timestamp(), "-3h"))
  }
  regions = {
    "eastus"             = "estus"
    "eastus2"            = "estus2"
    "southcentralus"     = "sthcenus"
    "westus2"            = "wstus2"
    "westus3"            = "wstus3"
    "australiaeast"      = "ausest"
    "southeastasia"      = "sthestasia"
    "northeurope"        = "ntheur"
    "swedencentral"      = "swecen"
    "uksouth"            = "uksth"
    "westeurope"         = "wsteur"
    "centralus"          = "cenus"
    "northcentralus"     = "nthcenus"
    "westus"             = "wstus"
    "southafricanorth"   = "sthafrnth"
    "centralindia"       = "cenind"
    "eastasia"           = "estasia"
    "japaneast"          = "jpnest"
    "jioindiawest"       = "jioindwst"
    "koreacentral"       = "korcen"
    "canadacentral"      = "cndcen"
    "francecentral"      = "frncen"
    "germanywestcentral" = "gerwstcen"
    "norwayeast"         = "norest"
    "switzerlandnorth"   = "swtnth"
    "uaenorth"           = "uaenth"
    "brazilsouth"        = "brzsth"
    "centralus"          = "cenusstage"
    "eastuss"             = "estusstage"
    "eastus2s"            = "estus2stage"
    "northcentraluss"     = "nthcenusstage"
    "southcentraluss"     = "sthcenusstage"
    "westuss"             = "wstusstage"
    "westus2s"            = "wstus2stage"
    "asia"               = "asia"
    "asiapacific"        = "asiapac"
    "australia"          = "aus"
    "brazil"             = "brz"
    "canada"             = "can"
    "europe"             = "eur"
    "france"             = "frn"
    "germany"            = "ger"
    "global"             = "global"
    "india"              = "india"
    "japan"              = "japan"
    "korea"              = "korea"
    "norway"             = "norway"
    "southafrica"        = "sthafr"
    "switzerland"        = "swtz"
    "unitedarabemirates" = "uae"
    "unitedkingdom"      = "uk"
    "unitedstatess"       = "unitedstates"
    "eastasias"           = "estasiastage"
    "southeastasias"      = "stheastasiastage"
    "centraluseuap"      = "centraluseuap"
    "eastus2euap"        = "eastus2euap"
    "westcentralus"      = "wstcenus"
    "southafricawest"    = "sthafrwst"
    "australiacentral"   = "auscen"
    "australiacentral 2" = "auscen2"
    "australiasoutheast" = "aussthest"
    "japanwest"          = "jpnwst"
    "jioindiacentral"    = "jioindiacentral"
    "koreasouth"         = "korsth"
    "southindia"         = "sthindia"
    "westindia"          = "westind"
    "canadaeast"         = "cndest"
    "francesouth"        = "frnsth"
    "germanynorth"       = "gernth"
    "norwaywest"         = "norwst"
    "switzerlandwest"    = "swtwst"
    "ukwest"             = "ukwest"
    "uaecentral"         = "uaecentral"
    "brazilsoutheast"    = "brzsthest"
  }
}