# Resource: EC2 Instance
resource "aws_instance" "ec2_1" {
  ami = "ami-08a6efd148b1f7504"
  instance_type = "t3.micro"
  user_data = file("${path.module}/app_install.sh")
  tags = {
    "name" = "ec2 demo"
  }
}