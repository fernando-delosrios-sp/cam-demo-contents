resource "aws_vpc" "vpc" {
  for_each = toset(var.cities)
  cidr_block           = cidrsubnet(var.cidr_block, 8, index(var.cities, each.key))
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
      Name = "${each.key} city VPC",
      City = each.key
    }
}