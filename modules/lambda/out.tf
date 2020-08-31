output "lambda_function_arn" {
  description = "The  ARN of the Lambda Function"
  value       = aws_lambda_function.lambda_function.arn
}
output "invoke_arn" {
  description = "The Invoke ARN of the Lambda Function"
  value       = aws_lambda_function.lambda_function.invoke_arn
}