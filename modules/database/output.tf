output "mysql_instance" {
  value = aws_db_instance.mysql_instance.id
}

output "subnetdb" {
  value = aws_db_subnet_group.subnetdb.id
}

