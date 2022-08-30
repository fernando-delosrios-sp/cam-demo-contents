resource "azuread_group" "cities_group" {
  for_each = toset(var.cities)
  display_name             = each.key
  mail_enabled = false
  security_enabled = true
}

resource "azuread_group" "departments_group" {
  for_each = toset(var.departments)
  display_name             = each.key
  mail_enabled = false
  security_enabled = true
}

resource "azuread_group" "jobTitles_group" {
  for_each = toset(var.jobTitles)
  display_name             = each.key
  mail_enabled = false
  security_enabled = true
}
