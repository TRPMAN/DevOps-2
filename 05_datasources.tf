# AWS Availability Zones
data "aws_availability_zones" "azs" {
  #state = "available"
}

# Latest AMI ID for Amazon Linux with gp2
data "aws_ami" "ami_amazonlinux" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp3"]
  }
}

# Find your current public IP address
data "http" "myip" {
  url = "https://api.ipify.org"
}