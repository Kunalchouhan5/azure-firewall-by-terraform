resource "azurerm_resource_group" "RG-1" {
  name     = var.rg
  location = var.location
}

resource "azurerm_virtual_network" "VNet" {
  name                = var.Vnet-name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.RG-1.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.Subnet-name
  resource_group_name  = azurerm_resource_group.RG-1.name
  virtual_network_name = azurerm_virtual_network.VNet.name
  address_prefixes = var.address_prefixes
}

resource "azurerm_public_ip" "fw-pip" {
  name                = var.public-ip
  location            = var.location
  resource_group_name = azurerm_resource_group.RG-1.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "example" {
  name                = var.firewall_name
  location            = var.location
  resource_group_name = azurerm_resource_group.RG-1.name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.subnet.id
    public_ip_address_id = azurerm_public_ip.fw-pip.id
  }
}