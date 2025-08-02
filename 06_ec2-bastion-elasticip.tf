# Elastic IP for Bastion Host
resource "aws_eip" "ec2_bastion_eip" {
  instance = module.ec2_bastion_instance.id
  depends_on = [ 
    module.ec2_bastion_sg,
    module.vpc_1
   ]
  tags = local.common_tags
}