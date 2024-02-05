# resource "aws_kms_key" "kms" {
# for_each = toset(var.departments)
#   description             = "${each.key} KMS key"
#   deletion_window_in_days = 10 
# }

# resource "aws_kms_alias" "kms_alias" {
#   for_each = toset(var.departments)
#   name          = replace("alias/${each.key}", " ", "_")
#   target_key_id = aws_kms_key.kms[each.key].key_id
# }