output "instance_1_ip_addr" {
  value = aws_instance.it-meetup.public_ip
}

output "private_key" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}