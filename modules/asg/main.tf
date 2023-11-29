resource "aws_launch_template" "asg_launch_template" {
  name                        = "${var.henryproject}-instance"
  image_id                    = var.ami_id # "ami-12345678"  Replace with the desired AMI ID
  instance_type               = var.instance_type
  key_name                    = var.key_name
   network_interfaces {
    device_index    = 0
    associate_public_ip_address = true
    security_groups             = [ var.webserver-secgrp ]  # Replace with desired security group IDs
  }

 # associate_public_ip_address = true
        tags = {
            Name = "${var.henryproject}-ec2instance"
        }
  
  user_data = "${base64encode(data.template_file.test.rendered)}" 

  lifecycle {
    create_before_destroy = true
  } 
}

resource "aws_autoscaling_group" "asg" {
  name                        = "${var.henryproject}-asg"
  min_size                    = 2
  max_size                    = 5
  desired_capacity            = 2
  vpc_zone_identifier         = [ var.publicsubnet2, var.publicsubnet ]
  
  launch_template {
    id      = aws_launch_template.asg_launch_template.id
    version = aws_launch_template.asg_launch_template.latest_version
  }
  health_check_grace_period   = 300
  health_check_type           = "ELB"

  target_group_arns = [ var.alb_target_group_arn ]

  lifecycle {
    create_before_destroy = true
  }
}

data "template_file" "test" {
  template = <<EOF
#!/bin/bash
sudo yum install wget unzip httpd -y
sudo mkdir -p /tmp/webfiles
cd /tmp/webfiles
sudo wget https://www.tooplate.com/zip-templates/2098_health.zip
sudo unzip 2098_health
sudo rm -rf 2098_health.zip
cd 2098_health
sudo cp -r * /var/www/html/
sudo systemctl start httpd
sudo systemctl enable httpd
sudo rm -rf /tmp/webfiles
EOF
}
