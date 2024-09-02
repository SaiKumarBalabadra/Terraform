output "rg_name" {
  value = azurerm_resource_group.rg.name
}

output "rg_location" {
  value = azurerm_resource_group.rg.location
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
}

resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
}