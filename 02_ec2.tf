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

  # create the same instance 2 times
  count = 2
  tags = {
    "Name" = "ec2 demo-${count.index}"
  }
}