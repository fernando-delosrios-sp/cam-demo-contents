resource "aws_dynamodb_table" "dynamodb" {
for_each = toset(var.departments)
  name             = replace(each.key, " ", "_")
  hash_key         = "key"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "key"
    type = "S"
  }
}