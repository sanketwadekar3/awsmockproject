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
