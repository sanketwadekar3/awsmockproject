resource "aws_api_gateway_rest_api" "demo" {
  name        = var.api_name    //"AWS_Mock_API"
}
/*
data "aws_cognito_user_pools" "cognitopool" {
  name = var.cognito_user_pool_name
}
*/
resource "aws_api_gateway_authorizer" "authorizer" {
  name          = var.authapiname
  type          = var.type
  rest_api_id   = aws_api_gateway_rest_api.demo.id
  provider_arns = [var.provider_arns]                                        //data.aws_cognito_user_pools.cognitopool.arns
}
