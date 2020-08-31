resource "aws_cognito_user_pool_client" "client" {
  name = var.appclientname

  user_pool_id = var.user_pool_id
  supported_identity_providers = var.supported_identity_providers
  allowed_oauth_flows_user_pool_client = var.required
  generate_secret = var.generate_secret
 
  allowed_oauth_flows           = var.allowed_oauth_flows
  allowed_oauth_scopes          = var.allowed_oauth_scopes
  explicit_auth_flows           = var.explicit_auth_flows
  prevent_user_existence_errors = var.prevent_user_existence_errors
  read_attributes               = var.read_attributes
  refresh_token_validity        = var.refresh_token_validity
  write_attributes              = var.write_attributes
  callback_urls                 = var.callback_urls
}

