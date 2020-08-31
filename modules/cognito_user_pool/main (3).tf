resource "aws_cognito_user_pool" "krackit11pool" {
  name = var.userpoolname
  alias_attributes = var.alias_attributes
  auto_verified_attributes = var.auto_verified_attributes
  lambda_config {
    pre_sign_up = var.lambdafunctionarn
    post_confirmation = var.lambdafunctionarn2
    }

  verification_message_template {
    default_email_option = var.default_email_option
  }

  password_policy {
    minimum_length    = var.minimum_length
    require_lowercase = var.require_lowercase
    require_numbers   = var.require_numbers
    require_symbols   = var.require_symbols
    require_uppercase = var.require_uppercase
  }

   schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 7
      max_length = 256
    }
  }
 
   schema {
    name                     = "name"
    attribute_data_type       = "String"
    developer_only_attribute = false
    mutable                  = true
    required                 = true
    string_attribute_constraints {
      min_length = "0"
      max_length = "2048"
    }
  }
 
  schema {
    name                     = "birthdate"
    attribute_data_type       = "String"
    developer_only_attribute = false
    mutable                  = true
    required                 = true
    string_attribute_constraints {
      min_length = "0"
      max_length = "2048"
    }
  }
 
  schema {
    name                     = "phone_number"
    attribute_data_type       = "String"
    developer_only_attribute = false
    mutable                  = true
    required                 = true
    string_attribute_constraints {
      min_length = "10"
      max_length = "12"
    }
  }
  
  tags = {
    Name    = var.tag_name1
    Environment = var.Environment
  }
}

output "poolid"{
  value = aws_cognito_user_pool.krackit11pool.id
}
output "poolarn"{
  value = aws_cognito_user_pool.krackit11pool.arn
}

