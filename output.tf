output "server_network" {
  description = "Return all information about server network"
  value       = twc_server.default.networks
}

output "server_public_ip" {
  description = "Return server public IP"
  value       = twc_server.default.main_ipv4
}

output "server_name" {
  description = "Return server name"
  value       = twc_server.default.name
}

output "server_id" {
  description = "Return server id"
  value       = twc_server.default.id
}
