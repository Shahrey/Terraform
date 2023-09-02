
# output "instance_id" {
#   description = "ID of the EC2 instance"
#   value       = aws_instance.app_server.id
# }

# output "instance_public_ip" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_instance.app_server.public_ip
# }

# output "instance_private_ip" {
#   description = "Public IP address of the EC2 instance"
#   value       = aws_instance.app_server.private_ip
# }


# output "instance_availability_zone" {
#   description = "availability zone of the EC2 instance"
#   value       = aws_instance.app_server.availability_zone
# }


# output "instance_id" {
#   description = "ID of the EC2 instance"
#   value       = ec2_instances.public_ip
# }

# output "instance_public_ip" {
#   description = "Public IP address of the EC2 instance"
#   value       = module.vpc.ec2_instances.id
# }

# output "instance_private_ip" {
#   description = "Public IP address of the EC2 instance"
#   value       = module.ec2_instances.private_ip
# }


# output "instance_availability_zone" {
#   description = "availability zone of the EC2 instance"
#   value       = module.ec2_instances.availability_zone
# }

# output "rds_hostname" {
#   description = "RDS instance hostname"
#   value       = aws_db_instance.terraformdb.address
#   sensitive   = true
# }

# output "rds_port" {
#   description = "RDS instance port"
#   value       = aws_db_instance.terraformdb.port
#   sensitive   = true
# }

# output "rds_username" {
#   description = "RDS instance root username"
#   value       = aws_db_instance.terraformdb.username
#   sensitive   = true
# }