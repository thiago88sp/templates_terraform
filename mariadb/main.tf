provider "azurerm" {
  features {}
}

#Criação de Resource Group onde o recurso ficará alocado
resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-resources"
  location = var.location
}

#Criação do APIM Management
resource "azurerm_api_management" "apim_service" {
  name                = "${var.prefix}-apim-service"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "Example Publisher"
  publisher_email     = "publisher@example.com"
  sku_name            = var.sku
  tags = {
    Environment = "Example"
  }
  policy {
    xml_content = <<XML
    <policies>
      <inbound />
      <backend />
      <outbound />
      <on-error />
    </policies>
XML
  }
}
