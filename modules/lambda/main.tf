provider "aws" {
  region = var.region
  profile  = "default"
}
#_________________________________________________________________
#lambda function
#_________________________________________________________________
/*provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = var.filename
  output_path = var.outputfilepath
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = var.dirname
  output_path = "lambda.zip"
}*/
resource "aws_lambda_function" "lambda_function" {
  role             = var.rolearn
  handler          = var.handler
  runtime          = var.runtime
  //filename       = data.archive_file.zip.output_path
  filename         = var.filename
  function_name    = var.function_name
  source_code_hash = filebase64sha256(var.filename)
  
  vpc_config {
      subnet_ids            = [var.subnet1]
      security_group_ids    = [var.securitygroup]
  }
}
 

