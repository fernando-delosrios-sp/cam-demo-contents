resource "aws_iam_group" "group" {
  for_each = toset(var.jobTitles)
  name             = replace(replace(each.key, " ", "_"), "&", "and")
}