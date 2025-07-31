# Resource: EC2 Instance
resource "aws_instance" "ec2_tf_basic" {
  # .id come from attribute on document
  ami = data.aws_ami.ami.id

  # instance_type = var.instance_type
  # Using List: instance_type = var.instance_type_list[1]
  # Using Map:
  instance_type = var.instance_type_map["mi"]

  user_data = file("${path.module}/app_install.sh")
  key_name = var.Instance_keypair

  # .id come from attribute on document
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id]

  # for_each receive only set of string or map !!! not list
  for_each = toset(data.aws_availability_zones.ec2_zone.names)
  availability_zone = each.key

  # create the same instance 2 times
  # count = 2
  tags = {
    "Name" = "EC2Demo-${each.key}"
  }
}

data "aws_availability_zones" "ec2_zone" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

  exclude_names = ["us-east-1e"]
}