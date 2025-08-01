# VPC Module
module "vpc_1" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.1"

  # VPC Basic Details
  name            = "${local.name}-${var.vpc_name}"
  cidr            = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # NAT
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  # DNS
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Type = "public-subnets"
  }
  private_subnet_tags = {
    Type = "private-subnets"
  }
  tags = local.common_tags
  vpc_tags = local.common_tags

  # Database 
  create_database_subnet_group        = var.vpc_create_database_subnet_group
  create_database_subnet_route_table  = var.vpc_create_database_subnet_route_table

  database_subnets     = var.vpc_database_subnets
  database_subnet_tags = {
    Type = "db-subnets"
  }
}