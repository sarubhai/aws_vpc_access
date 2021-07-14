# AWS Infra Demo VPC Access:
Configure AWS VPC access via OpenVPN using Terraform. This is part of the AWS demo infra setup for Enterprise Terraform workspace

## Resources
- 1 Security Group
- 1 EC2 Instance of OpenVPN Access Server

## OpenVPN Setup
- Browse to <openvpn_access_server_url> ignore SSL warning
- Login with user as openvpn & <vpn_admin_password>
- Download the VPN connection profile
- Use OpenVPN client to connect to AWS VPC
