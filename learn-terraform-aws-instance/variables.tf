variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  //default     = "TerraformServerInstance"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}




variable "ec2_instance_type" {
  description = "Enter AWS EC2 instance type."
  type        = string
  default = "t2.micro"
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "example-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.103.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}

variable "db_password" {
  description = "RDS root user password"
  type        = string
  sensitive   = true
}


# # use data source to get all avalablility zones in region
# data "aws_availability_zones" "available_zones" {}

# # create public subnet az1
# resource "aws_subnet" "public_subnet_az1" {
#   vpc_id                  = aws_vpc.vpc.id
#   cidr_block              = var.public_subnet_az1_cidr
#   availability_zone       = data.aws_availability_zones.available_zones.names[0]
#   map_public_ip_on_launch = true

#   tags      = {
#     Name    = "public subnet az1"
#   }
# }