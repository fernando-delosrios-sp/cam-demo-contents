resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  depends_on          = [azurerm_resource_group.global_resource_group]
  for_each            = toset(var.departments)
  name                = lower(replace("${each.key}-${var.domain}", " ", "-"))
  resource_group_name = "Global"
  location            = var.location
  geo_location {
    location          = var.geo_location
    failover_priority = 0
  }
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  offer_type = "Standard"
  # enable_free_tier = "true"
  # capabilities = { "EnableTable" }

}

resource "azurerm_cosmosdb_sql_database" "cosmosdb_database" {
  for_each            = toset(var.departments)
  name                = lower(replace("${each.key}-${var.domain}", " ", "-"))
  resource_group_name = "Global"
  account_name        = azurerm_cosmosdb_account.cosmosdb_account[each.key].name
}