resource "azurerm_network_interface" "nic" {
    name                    = "${var.vm_name}-nic"
    location                = module.resource_group.rg_location
    resource_group_name     = module.resource_group.rg_name

    ip_configuration {
      name = "internal"
      subnet_id = module.subnet.subnet_id
      private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "vm" {
    name = var.vm_name
    location = module.resource_group.rg_location
    resource_group_name = module.resource_group.rg_name
    network_interface_ids = [azurerm_network_interface.nic.id]
    vm_size = var.vm_size

    storage_os_disk {
      name = "${var.vm.name}-osdisk"
      caching = "ReadWrite"
      create_option = "FromImage"
      managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
      publisher = "Canonical"
      offer = "UbuntuServer"
      sku = "18.04-LTS"
      version = "latest"
    }

    os_profile {
      computer_name = var.vm_name
      admin_username = var.admin_username
      admin_password = var.admin_password
    }

    os_profile_linux_config {
      disable_password_authentication = false
    }
}