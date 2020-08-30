
#creation of s3bucket
module "s3-bucket" {
  source = "../modules/bucket"
}

#uploading files to bucket
module "s3-bucket-obj1" {
  source = "../modules/objectupload"
  key = var.key[0]
  s3source = var.s3source[0]
  bucketid = module.s3-bucket.bucketid
  depends_on = [module.s3-bucket]
}

#uploading files to bucket
module "s3-bucket-obj2" {
  source = "../modules/objectupload"
  key = var.key[1]
  s3source = var.s3source[1]
  bucketid = module.s3-bucket.bucketid
  depends_on = [module.s3-bucket]
}

#uploading files to bucket
module "s3-bucket-obj3" {
  source = "../modules/objectupload"
  key = var.key[2]
  s3source = var.s3source[2]
  bucketid = module.s3-bucket.bucketid
  depends_on = [module.s3-bucket]
}


#VPC
module "vpc" {
  source   = "../modules/networking/vpc"
  vpc_cidr = var.vpc_cidr
  tag_name_vpc = var.tag_name[0]
}

#Internet gateway
module "internet_gw" {
    source   = "../modules/networking/igw"
    vpc_id = module.vpc.vpc_id
    tag_name = var.tag_name[1]
}

#Elastic IP
module "elastic_ip" {
  source  = "../modules/networking/e_ip"
  vpc = var.vpc
  dependency = [module.internet_gw]
}

#Nat gateway 
module "nat_gw" {
  source = "../modules/networking/nat"
  allocation_id = module.elastic_ip.nat_id
  subnet_id     = module.subnets.subnet[var.tag_name[3]]
  tag_name = var.tag_name[2]
}


#Subnets
module "subnets" {
  source = "../modules/networking/subnets"
  params = {
      "public_subnet" = {vpc_id = module.vpc.vpc_id, cidr_block = var.cidr_block[0], availability_zone = var.availability_zone[0], tag_name =var.tag_name[3]},
      "pvt_sub1" = {vpc_id = module.vpc.vpc_id, cidr_block = var.cidr_block[1], availability_zone = var.availability_zone[1], tag_name = var.tag_name[4]},
      "pvt_sub2" = {vpc_id = module.vpc.vpc_id, cidr_block = var.cidr_block[2], availability_zone = var.availability_zone[2],  tag_name = var.tag_name[5]}
  }
}

#Security group for public instance
module "public_ec2_sg" {
  source = "../modules/networking/security_group"
  vpc_id = module.vpc.vpc_id
  sg_name = var.sg_name[0]
  description = var.description [0]
  ingress = {
      "HTTP" = { from_port = var.from_port[0], to_port = var.to_port[0], protocol = var.protocol[0], cidr_blocks = [var.cidr_blocks[0]]},
      "HTTPS" = { from_port = var.from_port[1], to_port = var.to_port[1], protocol = var.protocol[0], cidr_blocks = [var.cidr_blocks[0]]},
      "SSH" = { from_port = var.from_port[2], to_port = var.to_port[2], protocol = var.protocol[0], cidr_blocks = [var.cidr_blocks[0]]},
  }
  egress ={
      "all" = { from_port = var.from_port[3], to_port = var.to_port[3], protocol = var.protocol[1], cidr_blocks = [var.cidr_blocks[0]]}
  }
}

#public route table 
module "public_route_table" {
  source = "../modules/networking/route_table"
  vpc_id = module.vpc.vpc_id
  cidr_block = var.cidr_blocks[0]
  gateway_id = module.internet_gw.igw_id
  tag_name = var.tag_name[6]
}

#public route table association
module "public_rt_association_table" {
  source = "../modules/networking/route_table_assoc"
  subnet_id  = module.subnets.subnet[var.tag_name[3]]
  route_table_id = module.public_route_table.rt_id
}

#Security group for private aurora instance
module "private_rds_sg" {
  source = "../modules/networking/security_group"
  vpc_id = module.vpc.vpc_id
  sg_name = var.sg_name[1]
  description = "private rds security group"
  ingress = {
      "HTTP" = { from_port = var.from_port[0], to_port = var.to_port[0], protocol =var.protocol[0], cidr_blocks = [var.cidr_blocks[1]]},
      "HTTPS" = { from_port = var.from_port[1], to_port = var.to_port[1], protocol = var.protocol[0] , cidr_blocks = [var.cidr_blocks[1]]}
  }
  egress ={
      "HTTP" = { from_port = var.from_port[0], to_port = var.to_port[0], protocol =var.protocol[0], cidr_blocks = [var.cidr_blocks[1]]},
      "HTTPS" = { from_port = var.from_port[1], to_port = var.to_port[1], protocol = var.protocol[0] , cidr_blocks = [var.cidr_blocks[1]]}
  }
}

#security group for aurora instance
module "private_rds_sg2" {
  source = "../modules/networking/security_group"
  vpc_id = module.vpc.vpc_id
  sg_name = var.sg_name[3]
  description = "private rds security group"
  ingress = {
       "MySQL" = { from_port = var.from_port[5], to_port = var.to_port[5],  protocol = var.protocol[0], cidr_blocks = [var.cidr_blocks[1]]},
  }
  egress ={
      "HTTP" = { from_port = var.from_port[0], to_port = var.to_port[0], protocol =var.protocol[0], cidr_blocks = [var.cidr_blocks[1]]},
      "HTTPS" = { from_port = var.from_port[1], to_port = var.to_port[1], protocol = var.protocol[0] , cidr_blocks = [var.cidr_blocks[1]]}
  }
}

#private rds subnet group
module "private_rds_subnet_group" {
  source = "../modules/subnet_group"
  name = var.name1
  subnet_ids = [module.subnets.subnet[var.tag_name[4]],module.subnets.subnet[var.tag_name[5]]]
  tag_name = var.tag_name[8]
}

#module for aurora mysql
#we have hardcoded the credentials here vecause we did'nt have the permission for KMS and aws secrets manager to store it
module "pvt_rds" {
  source = "../modules/rds"
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine 
  engine_mode             = var.engine_mode 
  engine_version          = var.engine_version 
  availability_zone      = var.availability_zone
  database_name           = var.database_name
  username  = var.username
  password         = var.password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot = var.skip_final_snapshot

}
#private route table for aurora  
module "private_route_table" {
  source = "../modules/networking/route_table"
  vpc_id = module.vpc.vpc_id
  cidr_block = var.cidr_blocks[0]
  gateway_id = module.nat_gw.nat_gw_id
  tag_name = var.tag_name[10]
}

#private route table association for aurora  
module "prvate_rt_association_table" {
  source = "../modules/networking/route_table_assoc"
  subnet_id  = module.subnets.subnet[var.tag_name[5]]
  route_table_id = module.private_route_table.rt_id
}
