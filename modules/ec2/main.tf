resource "aws_subnet" "webserver" {
    vpc_id = var.vpc_id
}

resource "aws_instance" "ec2_instances" {
  
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id


 vpc_security_group_ids = [
    var.vpc_security_group_ids
  ]

  tags = {
    Name = "henry-ec2instance"
  }
}
