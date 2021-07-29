provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name                  = "${var.resource_prefix}-RG"
  location              = var.node_location
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example_vnet" {
  name                  = "${var.resource_prefix}-vnet"
  resource_group_name   = azurerm_resource_group.example_rg.name
  location              = var.node_location
  address_space         = var.address_space
}

# Create a subnets within the virtual network
resource "azurerm_subnet" "example_subnet" {
  name                  = "${var.resource_prefix}-subnet"
  resource_group_name   = azurerm_resource_group.example_rg.name
  virtual_network_name  = azurerm_virtual_network.example_vnet.name
  address_prefixes      = var.address_prefixes
}

# Create Public IP
resource "azurerm_public_ip" "example_public_ip" {
  count                 = var.node_count
  name                  = "${var.resource_prefix}-${format("%02d", count.index)}-PublicIP"
  #name                 = "${var.resource_prefix}-PublicIP"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name
  allocation_method     = var.Environment == "Test" ? "Static" : "Dynamic"
  tags                  = {
  environment           = "Test"
}
}

# Create Network Interface
resource "azurerm_network_interface" "example_nic" {
  count                 = var.node_count
  #name                 = "${var.resource_prefix}-NIC"
  name                  = "${var.resource_prefix}-${format("%02d", count.index)}-NIC"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name

  ip_configuration {
  name                  = "internal"
  subnet_id             = azurerm_subnet.example_subnet.id
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id  = element(azurerm_public_ip.example_public_ip.*.id, count.index)

#public_ip_address_id   = azurerm_public_ip.example_public_ip.id
#public_ip_address_id   = azurerm_public_ip.example_public_ip.id
}
}

# Creating resource NSG
resource "azurerm_network_security_group" "example_nsg" {
  name                  = "${var.resource_prefix}-NSG"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name

# Security rule can also be defined with resource azurerm_network_security_rule, here just defining it inline.
security_rule {
  name                  = "Inbound"
  priority              = 100
  direction             = "Inbound"
  access                = "Allow"
  protocol              = "Tcp"
  source_port_range     = "*"
  destination_port_range = "*"
  source_address_prefix  = "*"
  destination_address_prefix = "*"
}

tags = {
environment = "Test"
}
}

# Subnet and NSG association
resource "azurerm_subnet_network_security_group_association" "example_subnet_nsg_association" {
  subnet_id = azurerm_subnet.example_subnet.id
  network_security_group_id = azurerm_network_security_group.example_nsg.id
}

# Virtual Machine Creation — Windows
resource "azurerm_windows_virtual_machine" "vm" {
  count = var.node_count
  name = "${var.resource_prefix}-${format("%02d", count.index)}"
  #name = "${var.resource_prefix}-VM"
  resource_group_name             = azurerm_resource_group.example_rg.name
  location                        = azurerm_resource_group.example_rg.location
  size                            = var.size
  admin_username                  = "adminuser"
  admin_password                  = "P@ssw0rd1234!"
  zone                            = "1"
  network_interface_ids = [
    element(azurerm_network_interface.example_nic.*.id, count.index)
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
