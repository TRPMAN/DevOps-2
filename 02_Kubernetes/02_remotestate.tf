# Terraform Remote State Datasource
data "terraform_remote_state" "eks" {
  # Remote - Store tfstate in a remote like s3
  # Local - Store tfstate in local machine
  backend = "local"
  config = {
    path = "../01_AWS-BaseResource/terraform.tfstate"
  }
}
