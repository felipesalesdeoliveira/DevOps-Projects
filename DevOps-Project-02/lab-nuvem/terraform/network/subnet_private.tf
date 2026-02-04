resource "azurerm_subnet" "app_subnet_private" {
  for_each = var.app_subnets
  name = each.key
  address_prefixes = [each.value]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.app_vnet.name
}

# associar NSG a todas as subnets do app
resource "azurerm_subnet_network_security_group_association" "app_nsg_assoc" {
  for_each = azurerm_subnet.app_subnet_private
  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.security_group_app.id
}