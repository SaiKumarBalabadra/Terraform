variable "vnet_name" {
    description = "name of vnet"
    default = "myVNet"
}

variable "address_space" {
    description = "the address space for vnet"
    default = "10.0.0.0/16"
}

output "network_name" {
  value = azurerm_virtual_network.vnet.name
}

resource "azurerm_virtual_network" "vnet" {
    name                        = var.vnet_name
    address_space               = [var.address_space]
    location                    = azurerm_resource_group.rg.location
    resouresource_group_name    = azurerm_resource_group.rg.name 
}
