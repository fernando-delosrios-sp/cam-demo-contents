resource "aws_internet_gateway" "igw" {
  for_each = toset(var.cities)
  vpc_id = aws_vpc.vpc[each.key].id
  tags = {
      "Name" = "${each.key} - Internet gateway"
    }
}