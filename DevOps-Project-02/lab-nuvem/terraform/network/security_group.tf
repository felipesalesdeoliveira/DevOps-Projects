resource "azurerm_network_security_group" "security_group_app" {
  name                = "security_group_app"
  location            = var.app_vnet_location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "allow_ssh_from_bastion"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = azurerm_subnet.bastion_subnet.address_prefixes[0]
    destination_address_prefix = azurerm_subnet.app_subnet_private.address_prefixes[0]
  }
}

# Associate NSG to both app subnets
resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg_assoc_1" {
  subnet_id                 = azurerm_subnet.app_subnet_private.id
  network_security_group_id = azurerm_network_security_group.security_group_app.id
}

resource "azurerm_subnet_network_security_group_association" "app_subnet_nsg_assoc_2" {
  subnet_id                 = azurerm_subnet.app_subnet_private_2.id
  network_security_group_id = azurerm_network_security_group.security_group_app.id
}