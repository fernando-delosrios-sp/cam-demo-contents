locals {
  vpc_networks = [
    for pair in setproduct(var.cities, var.departments) : {
      city = pair[0]
      department = pair[1]
    }
  ]
}


data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet" {
  depends_on = [aws_vpc.vpc]
  for_each = {
    for subnet in local.vpc_networks : "${subnet.city}.${subnet.department}" => subnet
  }
  cidr_block              = cidrsubnet(aws_vpc.vpc[each.value.city].cidr_block, 8, index(var.departments, each.value.department))
  vpc_id                  = aws_vpc.vpc[each.value.city].id
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
      "Name" = "${each.value.department} subnetwork at ${each.value.city}",
      "Type" = "department"
    }
}