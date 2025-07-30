# Terraform Output after apply

# EC2 Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.ec2_tf_basic.public_ip
}

# EC2 Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.ec2_tf_basic.public_dns
}

# .public_ip and .public_dns come from attribute on document