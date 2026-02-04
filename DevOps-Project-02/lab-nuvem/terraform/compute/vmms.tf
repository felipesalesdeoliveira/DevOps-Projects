resource "azurerm_linux_virtual_machine_scale_set" "app_s1" {
  name                = "vmss-app-s1"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  sku                 = var.vmss_sku
  instances           = var.vmss_instances
  admin_username      = var.admin_user

  admin_ssh_key {
    username   = var.admin_user
    public_key = var.admin_ssh_public_key
  }

  # cloud-init: download and extract site archive
  custom_data = base64encode(templatefile("${path.module}/../bootstrap/cloud-init.tpl", { site_url = azurerm_storage_blob.site_archive.url }))

  network_interface {
    name    = "vmss-nic-s1"
    primary = true

    ip_configuration {
      name      = "ipconfig"
      primary   = true
      subnet_id = azurerm_subnet.app_subnet_private.id
    }
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  lifecycle {
    ignore_changes = ["instances"]
  }
}

resource "azurerm_linux_virtual_machine_scale_set" "app_s2" {
  name                = "vmss-app-s2"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.location
  sku                 = var.vmss_sku
  instances           = var.vmss_instances
  admin_username      = var.admin_user

  admin_ssh_key {
    username   = var.admin_user
    public_key = var.admin_ssh_public_key
  }

  # cloud-init: download and extract site archive
  custom_data = base64encode(templatefile("${path.module}/../bootstrap/cloud-init.tpl", { site_url = azurerm_storage_blob.site_archive.url }))

  network_interface {
    name    = "vmss-nic-s2"
    primary = true

    ip_configuration {
      name      = "ipconfig"
      primary   = true
      subnet_id = azurerm_subnet.app_subnet_private_2.id
    }
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  lifecycle {
    ignore_changes = ["instances"]
  }
}
