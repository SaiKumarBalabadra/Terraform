variable "subnet_prefix" {
    description = "address prefix for subnet"
    default = "10.0.1.0/24"
}

variable "subnet_name" {
    description = "name of subnet"
    default = "mysubnet"
}

output "subnet_id" {
    value = azurerm_subnet.subnet.id
}

resource "azurerm_subnet" "subnet" {
    name = var.subnet_name
    resouresource_group_name    = module.resource_group.rg_name
    virtual_network_name = module.virtual_network.network_name
    address_prefixes = [var.subnet_prefix] 
}