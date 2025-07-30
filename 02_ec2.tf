# Resource: EC2 Instance
resource "aws_instance" "ec2_tf_basic" {
  # .id come from attribute on document
  ami = data.aws_ami.ami.id
  instance_type = var.instance_type
  user_data = file("${path.module}/app_install.sh")
  key_name = var.Instance_keypair
  # .id come from attribute on document
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id]
  tags = {
    "name" = "ec2 demo"
  }
}