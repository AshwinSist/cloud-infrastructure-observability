output "vpc_id" {
  description = "ID of the newly created VPC."
  value       = aws_vpc.observability.id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet reserved for future resources."
  value       = aws_subnet.private.id
}

output "instance_id" {
  description = "ID of the observability EC2 instance."
  value       = aws_instance.observability.id
}

output "instance_type" {
  description = "Configured EC2 instance type."
  value       = aws_instance.observability.instance_type
}

output "instance_public_ip" {
  description = "Public IP assigned to the instance; this may incur public IPv4 charges."
  value       = aws_instance.observability.public_ip
}

output "ssm_start_session_command" {
  description = "Command to start an interactive Session Manager session after deployment and SSM registration."
  value       = "aws ssm start-session --region ${var.aws_region} --target ${aws_instance.observability.id}"
}
