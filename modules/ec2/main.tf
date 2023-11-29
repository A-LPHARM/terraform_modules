resource "aws_instance" "ec2_instances" {

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

 vpc_security_group_ids = [
    var.webserver-secgrp
  ]

 user_data = "${base64encode(data.template_file.test.rendered)}" 

  tags = {
    Name = "henry-ec2instance"
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
