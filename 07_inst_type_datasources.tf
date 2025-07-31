# Datasource
data "aws_availability_zones" "avail_zone" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_ec2_instance_type_offerings" "inst_type" {
  #for_each = toset(["us-east-1a","us-east-1b","us-east-1e"])
  for_each = toset(data.aws_availability_zones.avail_zone.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name   = "location"
    #values = ["us-east-1a"]
    values = [each.key]
  }

  location_type = "availability-zone"
}


# Output
/*
output "output_1" {
  #value = data.aws_ec2_instance_type_offerings.inst_type1.instance_types
  value = [for i in data.aws_ec2_instance_type_offerings.inst_type: i.instance_types]
}
*/

output "output_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.inst_type: az => details.instance_types
  }
}

output "output_3" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.inst_type: 
    az => details.instance_types if length(details.instance_types) != 0
  }
}

output "output_4" {
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.inst_type: 
    az => details.instance_types if length(details.instance_types) != 0
  })
}