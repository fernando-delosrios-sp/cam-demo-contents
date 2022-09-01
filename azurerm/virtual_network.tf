locals {
  subnets = [
    for pair in setproduct(var.cities, var.departments) : {
      city = pair[0]
      department = pair[1]
    }
  ]
}

resource "azurerm_virtual_network" "virtual_network" {
  for_each = toset(var.cities)
  name     = replace(each.key, " ", "_")
  location = var.location
  resource_group_name = azurerm_resource_group.resource_group[each.key].name
  address_space = [cidrsubnet(var.cidr_block, 8, index(var.cities, each.key))]
}

resource "azurerm_subnet" "subnet" {
  depends_on = [azurerm_virtual_network.virtual_network]
  for_each = {
    for subnet in local.subnets : "${subnet.city}.${subnet.department}" => subnet
  }
  name = replace(each.key, " ", "_")
  resource_group_name = azurerm_resource_group.resource_group[each.value.city].name
  virtual_network_name = azurerm_virtual_network.virtual_network[each.value.city].name
  address_prefixes              = [cidrsubnet(azurerm_virtual_network.virtual_network[each.value.city].address_space[0], 8, index(var.departments, each.value.department))]
}