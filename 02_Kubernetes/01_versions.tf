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

  backend "s3" {
    bucket = "devops2-tf-eks-bucket"
    key = "dev/app1k8s/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "dev-app1k8s"
  }
}