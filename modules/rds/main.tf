resource "aws_rds_cluster" "default" {
  cluster_identifier      = var.cluster_identifier 
  engine                  = var.engine 
  engine_mode             = var.engine_mode 
  engine_version          = var.engine_version 
  availability_zones      = var.availability_zone
  database_name           = var.database_name 
  master_username         = var.username
  master_password         = var.password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot = var.skip_final_snapshot
}

/*
variable "db_username" {
  type = string
  default = "admin"
}

variable "db_password" {
  type = string
  default = "Password"
}

variable "db_name" {
  type = string
  default = "terra"
}

variable "db_host" {
  type = string
  default = "terra"
}
resource "null_resource" "db_setup" {

  # runs after database and security group providing external access is created
  //depends_on = ["aws_db_instance.your_database_instance", "aws_security_group.sg_allowing_external_access"]

    provisioner "local-exec" {
        command =  <<EOT
        echo "hi"
        mysql -h aws-mock-db.cluster-csaruqlxxway.us-east-1.rds.amazonaws.com -P 3306 -u admin -p Password terra < db.sql 
         EOT
        working_dir = "/home/ubuntu/mock/terraform/terraform/modules/rds/" 
        
    }

}
*/

