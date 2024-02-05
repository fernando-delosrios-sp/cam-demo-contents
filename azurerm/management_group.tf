# resource "azurerm_management_group" "management_group" {
#   for_each = toset(var.departments)
#   name     = replace(each.key, " ", "_")
# }