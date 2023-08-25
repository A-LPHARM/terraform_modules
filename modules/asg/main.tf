variable "aws_region" {}
variable "asg_name" {}
variable "launch_template_name" {}
variable "instance_type" {}
variable "subnet_ids" {}

provider "aws" {
  region = var.aws_region
}

resource "aws_launch_template" "asg_launch_template" {
  name_prefix                 = var.lc_name
  image_id                    = var.image_id # "ami-12345678"  Replace with the desired AMI ID
  instance_type               = var.instance_type
  security_groups            = [ aws_security_group.webserver-secgrp.id ]  # Replace with desired security group IDs
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = var.asg_name
  launch_configuration = aws_launch_configuration.asg_lc.name
  min_size             = 2
  max_size             = 5
  desired_capacity    = 2
  vpc_zone_identifier = [ var.publicsubnet2, var.publicsubnet ]

  lifecycle {
    create_before_destroy = true
  }
}
