# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc_main.id
}

# Output the Internet Gateway ID
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

# Output the IDs of the public subnets
output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id, aws_subnet.public_3.id]
}

# Output the IDs of the private subnets
output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [aws_subnet.private_1.id, aws_subnet.private_2.id, aws_subnet.private_3.id]
}

# Output the NAT Gateway ID
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat.id
}

# Output the public route table ID
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

# Output the private route table ID
output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}

# Output the bastion security group ID
output "bastion_security_group_id" {
  description = "The ID of the bastion security group"
  value       = aws_security_group.bastion_sg.id
}

# Output the private security group ID
output "private_security_group_id" {
  description = "The ID of the private security group"
  value       = aws_security_group.private_sg.id
}

# Output the public web security group ID
output "public_web_security_group_id" {
  description = "The ID of the public web security group"
  value       = aws_security_group.public_web_sg.id
}

# Output the bastion instance ID
output "bastion_instance_id" {
  description = "The ID of the bastion instance"
  value       = aws_instance.bastion.id
}

# Output the Jenkins instance ID
output "jenkins_instance_id" {
  description = "The ID of the Jenkins instance"
  value       = aws_instance.jenkins.id
}

# Output the app instance ID
output "app_instance_id" {
  description = "The ID of the app instance"
  value       = aws_instance.app.id
}
