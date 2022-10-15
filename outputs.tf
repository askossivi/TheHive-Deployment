# Output the Public IP
output "instance_ip_address" {
    value = aws_eip.my-eip.public_ip
    description = "The Public IP address of the main instance"
}