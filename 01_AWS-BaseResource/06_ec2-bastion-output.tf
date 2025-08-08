output "ec2_bastion_public_instance_ids" {
  value = module.ec2_bastion_instance.id
}

output "ec2_bastion_eip" {
  value = aws_eip.ec2_bastion_eip.public_ip
}