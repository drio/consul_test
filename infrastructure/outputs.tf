output "server_public_ip" {
  value       = aws_instance.consul-server.public_ip
  description = "The public IP of the consul server"
}

output "server_private_ip" {
  value       = aws_instance.consul-server.private_ip
  description = "The private IP of the consul server"
}

output "node1_public_ip" {
  value       = aws_instance.node1.public_ip
  description = "The public IP of the consul node 1"
}

output "node1_private_ip" {
  value       = aws_instance.node1.private_ip
  description = "The private IP of the consul node 1"
}

output "node2_public_ip" {
  value       = aws_instance.node2.public_ip
  description = "The public IP of the consul node 2"
}

output "node2_private_ip" {
  value       = aws_instance.node2.private_ip
  description = "The private IP of the consul node 2"
}
