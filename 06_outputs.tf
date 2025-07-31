# Terraform Output after apply

# EC2 Public IP
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  # .public_ip and .public_dns come from attribute on document
  value = aws_instance.ec2_tf_basic.public_ip
}

# EC2 Public DNS
output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  # .public_ip and .public_dns come from attribute on document
  value = aws_instance.ec2_tf_basic.public_dns
}

# Output - Loop List
output "output_list" {
  description = "For loop with list"
  value = [for output in aws_instance.ec2_tf_basic: output.public_dns]
}

# Output - Loop Map
output "output_map" {
  description = "For loop with map"                   # key            value
  value = {for output in aws_instance.ec2_tf_basic: output.id => output.public_dns}
}

# Output - Loop Map Advanced
output "output_map_ad" {
  description = "For loop with map advanced"              
  value = {for c, output in aws_instance.aws_instance.ec2_tf_basic: c => instance.public_dns}
}

# Output - Legacy Splat Operator
output "legacy_splat_output" {
  description = "Legacy Splat Operator"              
  value = aws_instance.ec2_tf_basic.*.public_dns
}

# Output - Latest Generalized Splat Operator
output "legacy_splat_output" {
  description = "Generalized Splat Operator"              
  value = aws_instance.ec2_tf_basic[*].public_dns
}