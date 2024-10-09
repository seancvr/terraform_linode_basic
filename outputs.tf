output "instance_id" {
  value       = linode_instance.basicVM.id
  description = "id of created linode"
}

output "instance_ip_addr" {
  value       = linode_instance.basicVM.ip_address
  description = "Public IP address of linode instance"
}