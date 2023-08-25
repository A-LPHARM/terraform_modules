variable "aws_region" {
  description = "The AWS region where Auto Scaling Group resources will be created."
  type        = string
}

variable "asg_name" {
  description = "The name of the Auto Scaling Group."
  default     =  " henryproject_asg"
  type        = string
}

variable "launch_template_name" {
  description = "name of the launch template"
  default     = " henryproject_template "
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type for the Launch Configuration."
  default     = "t2.micro"
  type        = string
}

variable "image_id" {
  default       = "ami-0889a44b331db0194"
  description   =  "id of the ami"
  type          =  string
}


variable "publicsubnet" { 
  description = "where the instance template will be built"
  default     = []
}

variable "publicsubnet2" { 
  description = "where the instance template will be built"
  default     = []
}
