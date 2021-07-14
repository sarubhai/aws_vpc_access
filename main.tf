# Name: main.tf
# Owner: Saurav Mitra
# Description: This terraform config will create 1 EC2 intance as OpenVPN Access Server
# https://openvpn.net/vpn-server-resources/amazon-web-services-ec2-byol-appliance-quick-start-guide

# OpenVPN AMI Filter
data "aws_ami" "openvpn" {
  owners      = ["679593333241"] # Canonical
  most_recent = true

  filter {
    name   = "name"
    values = [var.openvpn_server_ami_name]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# User Data Init
data "template_file" "init" {
  template = file("${path.module}/config_server.sh")

  vars = {
    VPN_ADMIN_USER     = var.vpn_admin_user
    VPN_ADMIN_PASSWORD = var.vpn_admin_password
  }
}


# EC2 Instance
resource "aws_instance" "openvpn_server" {
  ami                         = data.aws_ami.openvpn.id
  instance_type               = var.openvpn_server_instance_type
  associate_public_ip_address = true
  subnet_id                   = data.terraform_remote_state.vpc.outputs.public_subnet_id[0]
  vpc_security_group_ids      = [aws_security_group.openvpn_server_sg.id]
  key_name                    = var.keypair_name
  source_dest_check           = false

  user_data = data.template_file.init.rendered

  root_block_device {
    volume_size           = 30
    delete_on_termination = true
  }

  tags = {
    Name  = "${var.prefix}-openvpn-server"
    Owner = var.owner
  }
}
