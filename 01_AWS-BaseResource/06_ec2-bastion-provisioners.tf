# Create a null resource and provisioners
resource "null_resource" "copy_keypair" {
  depends_on = [ module.ec2_bastion_instance ]
  # Connection Block for Provisiobers to connect to EC2
  connection {
    type = "ssh"
    host = aws_eip.ec2_bastion_eip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("../../eks-terraform-key.pem")
  } 

  # copy private key to bastion host
  provisioner "file" {
    source  = "../../eks-terraform-key.pem"
    destination = "/tmp/eks-terraform-key.pem"
  }

  # fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/eks-terraform-key.pem"
    ]
  }
  
  # create Creation-Time on local (Triggered during Create Resource)
  provisioner "local-exec" {
    command = "bash -c 'echo VPC created on $(date) and VPC ID: ${module.vpc_1.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
  }
}