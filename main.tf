module "aws" {
  source      = "./aws"
  cities      = var.cities
  departments = var.departments
  jobTitles   = var.jobTitles
  groups      = var.groups
  domain      = var.domain
}

module "azurerm" {
  source       = "./azurerm"
  cities       = var.cities
  departments  = var.departments
  jobTitles    = var.jobTitles
  groups       = var.groups
  location     = var.location
  geo_location = var.geo_location
  domain       = var.domain
}

# module "azuread" {
#   source      = "./azuread"
#   cities      = var.cities
#   departments = var.departments
#   jobTitles   = var.jobTitles
#   groups      = var.groups
# }