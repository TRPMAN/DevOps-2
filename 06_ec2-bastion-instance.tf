# Bastion Host EC2 Instance
module "ec2_bastion_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.0.2"

  name = "${local.name}-bastionhost"
  ami = data.aws_ami.ami_amazonlinux.id
  instance_type = var.ec2_bastion_instance_type
  key_name = var.ec2_bastion_keypair

  vpc_security_group_ids = [module.ec2_bastion_sg.security_group_id]
  subnet_id = module.vpc_1.public_subnets[0] # want only 1 subnet

  tags = local.common_tags
}