# Input Variables

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

# AWS EC2 Instance Type - List
variable "instance_type_list" {
  description = "EC2 Instance type in List"
  type = list(string)
  default = ["t3.micro","t3.small","t3.large"]
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instance type in Map"
  type = map(string)
  default = {
    "mi" = "t3.micro"
    "sm" = "t3.small"
    "lg" = "t3.large"
  }
}

# AWS EC2 Key Pair
variable "Instance_keypair" {
  description = "Key Pair for EC2"
  type = string
  default = "terraform-key"
}
