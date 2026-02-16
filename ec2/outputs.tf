output "public_ips" {
  value = aws_instance.hamza[*].public_ip
}

output "instance_ids" {
  value = aws_instance.hamza[*].id
}
