resource "azurerm_resource_group" "resource_group" {
  for_each = toset(var.cities)
  name     = replace(each.key, " ", "_")
  location = var.location
}

resource "azurerm_resource_group" "global_resource_group" {
  name     = "Global"
  location = var.location
}