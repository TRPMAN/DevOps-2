# Terraform Block
terraform {
  required_version = "~> 1.12.0" 
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.6"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.38"
    }
  }
}