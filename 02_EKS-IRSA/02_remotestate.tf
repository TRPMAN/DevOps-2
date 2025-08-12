# Terraform Remote State Datasource
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "devops2-tf-eks-bucket"
    key = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}
