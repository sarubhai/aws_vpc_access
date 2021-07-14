# Name: outputs.tf
# Owner: Saurav Mitra
# Description: Outputs the OpenVPN Access Server IP
# https://www.terraform.io/docs/configuration/outputs.html

output "openvpn_access_server_url" {
  value       = "https://${aws_instance.openvpn_server.public_ip}:943/"
  description = "OpenVPN Access Server URL."
}
