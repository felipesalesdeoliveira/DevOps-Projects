resource "azurerm_virtual_network" "app-vnet" {
  name                = "app_vnet"
  address_space       = ["172.32.0.0/16"]
  location            = var.app_vnet_location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "app_subnet_private" {
  name                 = "subnet_private_1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes     = ["172.32.1.0/24"]
}

resource "azurerm_subnet" "app_subnet_private_2" {
  name                 = "subnet_private_2"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
  address_prefixes     = ["172.32.2.0/24"]
}
