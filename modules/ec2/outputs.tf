output "ec2_instance_ids" {
  description = "IDs of the created EC2 instances"
  value       = aws_instance.ec2_instances[*].id
}

output "vpc_id" {
    value = aws_vpc.henryvpc.id
}


output "publicsubnet" {
    value = aws_subnet.publicsubnet.id
}

output "webserver" {
    value = aws_security_group.webserver-secgrp.id
}