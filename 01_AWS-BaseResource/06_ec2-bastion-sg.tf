# Security Group
module "ec2_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"

  name        = "${local.name}-public-bastion-sg"
  description = "Security Group with SSH Port"
  vpc_id      = module.vpc_1.vpc_id

  # Ingress Rules
  ingress_rules        = ["ssh-tcp"]
  ingress_cidr_blocks  = ["${chomp(data.http.myip.response_body)}/32"]

  # Egress Rules
  egress_rules = ["all-all"]
  
  tags = local.common_tags
}
