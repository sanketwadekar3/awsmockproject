resource "aws_cognito_user_pool_domain" "main" {
  domain       = var.domain
  user_pool_id = var.user_pool_id
}