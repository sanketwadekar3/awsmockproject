#AMI
variable "name" {
    type = list(string)
    default = ["owner-alias","name"]
}
variable "values" {
    type = list(string)
    default = ["amazon","amzn2-ami-hvm*"]
}

#VPC
variable "vpc_cidr" {
    default = "20.0.0.0/16"
}
variable "tag_name" {
    default = ["krackit11-vpc","krackit11-igw","krackit11-nat-gw","krackit11-pub-sub","krackit11-pvt-sub1","krackit11-pvt-sub2","krackit11-pub-sub-rt","krackit11-public-ec2","krackit11-rds-subnet-group","krackit11-pvt-rds-instance","krackit11-pvt-sub-rt","krackit11-private-ec2"]
}

#Elastic IP
variable "vpc" {
    default = true
}

#Subnets
variable "cidr_block" {
    type = list
    default = ["20.0.1.0/28","20.0.2.0/26","20.0.3.0/26"]
}
variable "availability_zone" {
    default = ["us-east-1a","us-east-1b","us-east-1c"]
}

#Security group for public ec2 instance
variable "sg_name" {
    default = ["krackit11-pub-ec2-sg","krackit11-pvt-rds-sg","krackit11-pvt-ec2-sg","krackit11-pvt-rds-sg2"]
}

variable "description" {
    default = ["pub ec2 security group","private ec2 security group",]
}
variable "from_port" {
    default = ["80","443","22","0","1433","3306"]
}
variable "to_port" {
    default = ["80","443","22","0","1433","3306"]
}
variable "protocol" {
    default = ["tcp","-1"]
}
variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0","10.0.2.0/26","10.0.0.0/16"]
}

#public ec2 instance
variable "associate_public_ip_address" {
    default = [true,false]
}
variable "instance_type" {
    default = "t2.micro"
}
variable "iam" {
    default = "FE-Fresher-EC2"
}
variable "key_name" {
    default = "jenkins-krackit11"
}

#private rds subnet group
variable "name1" {
    default = "main_subnet_group"
}

#private rds instance in private subnet1
variable "engine" {
    default = "aurora-mysql"
}
variable "engine_mode" {
    default = "serverless"
}
variable "cluster_identifier"{
    default = "krackit11"
    }
variable "engine_version" {
    default = "5.7.mysql_aurora.2.03.2"
}
variable "database_name" {
    default = "test"
}
variable "username" {
    default = "admin"
}
variable "password" {
    default = "Password"
}
variable "skip_final_snapshot" {
    default = "true"
}
variable "preferred_backup_window" {
    default = "07:00-09:00"
}
variable "backup_retention_period" {
    default = 5
}

#s3

variable "s3source" {
    default = ["home.html","bg2.png","logo.png"]
}
variable "key" {
    default = ["home.html","bg2.png","logo.png"]
}
variable "appclientname" {
  default = "krackit11"
}
variable "domain" {
  default = "domain-krackit11"
}
variable "userpoolname" {
    default = "krackit11"
}

variable "required" {
    default = "true"
}
variable "generate_secret" {
    default = "false"
}

variable "alias_attributes" {
    default = ["phone_number", "preferred_username","email"]
}
variable "auto_verified_attributes" {
    default = ["email"]
}
variable "default_email_option" {
    default = "CONFIRM_WITH_LINK"
}
variable "minimum_length" {
    default = 10
}
variable "require_lowercase" {
    default = false
}
variable "require_symbols" {
    default = false
}
variable "require_numbers" {
    default = true
}


variable "require_uppercase" {
    default = true
}
variable "tag_name" {
    default = "krackit11"
}
variable "Environment" {
    default = "production"
}
variable "supported_identity_providers" {
    default = ["COGNITO"]
}
variable "allowed_oauth_flows" {
    default = ["implicit"]
}
variable "allowed_oauth_scopes" {
    default = ["phone", "email", "openid", "profile","aws.cognito.signin.user.admin"]
}
variable "explicit_auth_flows" {
    default = ["ALLOW_ADMIN_USER_PASSWORD_AUTH", "ALLOW_CUSTOM_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
}
variable "prevent_user_existence_errors" {
    default = "ENABLED"
}
variable "read_attributes" {
    default = ["address","birthdate","email","email_verified","family_name","gender","given_name","locale","middle_name","name","nickname","phone_number","phone_number_verified","picture","preferred_username","profile","zoneinfo","updated_at","website"]
}
variable "refresh_token_validity" {
    default = 7
}
variable "write_attributes" {
    default = ["address","birthdate","email","family_name","gender","given_name","locale","middle_name","name","nickname","phone_number","picture","preferred_username","profile","zoneinfo","updated_at","website"]
}

variable "lambda_function_name" {
  default = ["1presignuplambda","1postconfirmationlambda","1get_match_list","1aws-contestlist","1aws-addcash","1aws-enter-contest","1aws-myteam","1aws-playerinfo","1aws-createteam","1aws-leaderboard","1aws-mycontest","1aws-playerslist","1aws-walletinfo","1aws-withdrawcash"]
}
variable "filename" {
  default = ["lambda.zip","postcontrigger.zip","aws-matchlist.zip","aws-contestlist.zip","aws-addcash.zip","aws-enter-contest.zip","aws-myteam.zip","aws-playerinfo.zip","aws-createteam.zip","aws-leaderboard.zip","aws-mycontest.zip","aws-playerslist.zip","aws-walletinfo.zip","aws-withdrawcash.zip"]
}

variable "filepath" {
  default = ["../modules/lambda/lambda.zip","../modules/lambda/postcontrigger.zip","../modules/lambda/aws-matchlist.zip","../modules/lambda/aws-contestlist.zip","../modules/lambda/aws-addcash.zip","../modules/lambda/aws-enter-contest.zip","../modules/lambda/aws-myteam.zip","../modules/lambda/aws-playerinfo.zip","../modules/lambda/aws-createteam.zip","../modules/lambda/aws-leaderboard.zip","../modules/lambda/aws-mycontest.zip","../modules/lambda/aws-playerslist.zip","../modules/lambda/aws-walletinfo.zip","../modules/lambda/aws-withdrawcash.zip"]
}

variable "runtime_name" {
    default = ["nodejs12.x","python3.8"]
}

variable "api_name" {
    default = "aws_krackit11_api"
}