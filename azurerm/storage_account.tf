resource "azurerm_storage_account" "storage_account" {
  for_each = toset(var.cities)
  name     = lower(replace("${var.domain}${each.key}", " ", ""))
  resource_group_name      = azurerm_resource_group.resource_group[each.key].name
  location                 = azurerm_resource_group.resource_group[each.key].location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

