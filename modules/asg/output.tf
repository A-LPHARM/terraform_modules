output "autoscaling_group_name" {
  description = "The name of the created Auto Scaling Group."
  value       = aws_autoscaling_group.asg.name
}

output "launch_configuration_name" {
  description = "The name of the created Launch Configuration."
  value       = aws_launch_configuration.asg_lc.name
}
