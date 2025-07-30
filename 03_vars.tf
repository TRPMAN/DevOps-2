# AWS Region
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance type"
  type = string
  default = "t3.micro"
}

# AWS EC2 Key Pair
variable "Instance_keypair" {
  description = "Key Pair for EC2"
  type = string
  default = "terraform-key"
}