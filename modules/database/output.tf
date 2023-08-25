output "henryproject" {
    value = var.henryproject
}
output "db_username" {
  value = aws_db_instance.mysql_instance.db_username
}
output "password" {
  value = aws_db_instance.mysql_instance.password
}

output "db-identifier" {
  value = aws_db_instance.mysql_instance.identifier
}
output "db_id" {
  value = aws_db_instance.mysql_instance.id
}
output "db_name" {
  value = aws_db_instance.mysql_instance.db_name
}

output "privatesubnet1" {
  value = aws_subnet.privatesubnet1.id
}

output "privatesubnet2" {
  value = aws_subnet.privatesubnet2.id
}