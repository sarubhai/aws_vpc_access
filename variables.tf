# Name: variables.tf
# Owner: Saurav Mitra
# Description: Variables used by terraform config to create EC2 instance for OpenVPN Access Server

# Tags
variable "prefix" {
  description = "This prefix will be included in the name of the resources."
  default     = "aws-infra"
}

variable "owner" {
  description = "This owner name tag will be included in the owner of the resources."
  default     = "Saurav Mitra"
}


# OpenVPN Access Server
variable "openvpn_server_ami_name" {
  description = "The OpenVPN Access Server AMI Name."
  default     = "OpenVPN Access Server Community Image-fe8020db-5343-4c43-9e65-5ed4a825c931-ami-06585f7cf2fb8855c.4"
}

variable "openvpn_server_instance_type" {
  description = "The OpenVPN Access Server Instance Type."
  default     = "t2.micro"
}

variable "keypair_name" {
  description = "The AWS Key pair name."
}

variable "vpn_admin_user" {
  description = "The OpenVPN Admin User."
  default     = "openvpn"
}

variable "vpn_admin_password" {
  description = "The OpenVPN Admin Password."
}
