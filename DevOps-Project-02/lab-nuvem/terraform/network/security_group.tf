resource "azurerm_network_security_group" "security_group_app" {
  name                = "security_group_app"
  location            = var.app_vnet_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "security_group_app"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = azurerm_subnet.bastion_subnet.address_prefix
    destination_address_prefix = azurerm_subnet.app_subnet.address_prefix
  }
}