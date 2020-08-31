variable "region" {
  default = "us-east-1"
}

variable "function_name" {
  
}
/*
variable "handler" {
  default = ["lambda.handler", "lambda_function.handler"]
}
*/
variable "handler" {
  
}
variable "runtime" {
  
}

variable "securitygroup" {
  default = "sg-08038fc7febdffbad"
}

variable "subnet1" {
  default = "subnet-0ec9c9c7adddcf7ee"
}

variable "filename" {
 
}

variable "outputfilepath" {
 
}

variable "rolearn" {
  default = "arn:aws:iam::488599217855:role/lambda-basic-execution"
}