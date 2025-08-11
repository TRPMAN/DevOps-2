# Terraform Remote State Datasource
data "terraform_remote_state" "eks" {
  # Remote - Store tfstate in a remote like s3
  # Local - Store tfstate in local machine
  /*backend = "local"
  config = {
    path = "../01_AWS-BaseResource/terraform.tfstate"
  }
  */
  backend = "s3"
  config = {
    bucket = "devops2-tf-eks-bucket"
    key = "dev/eks-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}
