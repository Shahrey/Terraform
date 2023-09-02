terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


# provider "aws" {
#   region     = var.aws_region
#   access_key = var.access_key
#   secret_key = var.secret_key
# }

# resource "aws_instance" "app_server" {
#   ami           = "ami-830c94e3"
#   instance_type = "t2.micro"

#   tags = {
#     Name = "TerraformServerInstance"
#   }
# }


// RDS Portion Start
resource "aws_db_subnet_group" "terraformdb" {
  name       = "devops"
  subnet_ids = module.vpc.public_subnets

  tags = {
    Name = var.instance_name
  }
}

resource "aws_db_instance" "terraformdb" {
  identifier             = "devops"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "sqlserver-ex"
  engine_version         = "15.00.4316.3.v1"
  username               = "Dev"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.terraformdb.name
  vpc_security_group_ids = [module.vpc.default_security_group_id]//[aws_security_group.rds.id]
  parameter_group_name   = "default.sqlserver-se-15.0"
  publicly_accessible    = true
  skip_final_snapshot    = true
}

resource "aws_db_parameter_group" "terraformdb" {
  name   = "devops"
  family = "sqlserver-ex"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}
// RDS Portion End

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = var.vpc_tags
}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"
  count   = 2 #length(module.vpc.public_subnets)

  //name = var.instance_name

  ami                    = "ami-0c5204531f799e0c6"
  # instance_type          = "t2.micro"
  instance_type = var.ec2_instance_type

  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[count.index]

  # subnet_id              = module.vpc.public_subnets[1]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "ali-${count.index}"
  }
  
}