# Terraform Block
terraform {
  required_version = "~> 1.12.0" 
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.6"
    }
  }

  backend "s3" {
    bucket = "devops2-tf-eks-bucket"
    key = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-ekscluster"
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
}