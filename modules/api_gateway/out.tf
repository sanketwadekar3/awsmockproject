
output "api_id" {
    value = aws_api_gateway_rest_api.demo.id
}
output "root_resource_id" {
    value = aws_api_gateway_rest_api.demo.root_resource_id
}
output "auth_id" {
    value = aws_api_gateway_authorizer.authorizer.id
}
output "execution_arn" {
    value = aws_api_gateway_rest_api.demo.execution_arn
}