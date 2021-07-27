provider "azurerm" {
  features {}
}

#Criação de Resource Group
resource "azurerm_resource_group" "rsg" {
  name     = "${var.prefix}-resources"
  location = var.location
}

#Criação de Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name
}

#Criação de Subnet
resource "azurerm_subnet" "internal" {
  name                 = "Subnet_A"
  resource_group_name  = azurerm_resource_group.rsg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

#Criação de NIC
resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  resource_group_name = azurerm_resource_group.rsg.name
  location            = azurerm_resource_group.rsg.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

#Criação de Máquina Virtual
resource "azurerm_windows_virtual_machine" "vm" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = azurerm_resource_group.rsg.name
  location                        = azurerm_resource_group.rsg.location
  size                            = var.size
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd1234!"
  zone                            = "1"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}