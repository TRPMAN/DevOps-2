# Terraform Block
terraform {
  required_version = "~> 1.12.0" # ~> allow greater version
  required_providers {
    # aws is arg so it need "="
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.6"
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
}