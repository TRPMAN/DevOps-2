# AWS EC2 Instance Type
variable "ec2_bastion_instance_type" {
  type = string
  default = "t3.micro"
}

# AWS EC2 Key Pair
variable "ec2_bastion_keypair" {
  type = string
  default = "eks-terraform-key"
}