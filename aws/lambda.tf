# data "aws_caller_identity" "current" {}

# data "archive_file" "zip_the_python_code" {
#   type        = "zip"
#   source_dir  = "${path.module}/python/"
#   output_path = "${path.module}/python/hello-python.zip"
# }

# resource "aws_iam_role" "iam_for_lambda" {
#   name = "iam_for_lambda"

#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Action": "sts:AssumeRole",
#       "Principal": {
#         "AWS": "${data.aws_caller_identity.current.account_id}"
#       },
#       "Effect": "Allow",
#       "Sid": ""
#     }
#   ]
# }
# EOF
# }

# resource "aws_lambda_function" "root_lambda" {
#   function_name = "Lambda_test"
#   role          = aws_iam_role.iam_for_lambda.arn
#   filename                       = "${path.module}/python/hello-python.zip"
#   handler                        = "index.lambda_handler"
#   runtime                        = "python3.8"
# }