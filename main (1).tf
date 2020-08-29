provider "aws" {
  region = var.region
  profile  = "default"
}
#_________________________________________________________________
#lambda function
#_________________________________________________________________
provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "lambda.js"
  output_path = "lambda.zip"
}


resource "aws_lambda_function" "lambda_function" {
  role             = "arn:aws:iam::488599217855:role/lambda-basic-execution"
  handler          = var.handler
  runtime          = var.runtime
  filename         = data.archive_file.zip.output_path
  function_name    = var.function_name
  source_code_hash = filebase64sha256(data.archive_file.zip.output_path)

  vpc_config {
      subnet_ids            = ["subnet-0ec9c9c7adddcf7ee"]
      security_group_ids    = ["sg-08038fc7febdffbad"]
  }
}
 

