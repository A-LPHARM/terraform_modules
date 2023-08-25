variable "vpc_id" { 
    type = string
    description = "henryvpc"
}

variable "subnet_id" {
    type = string
    description = "publicsubnet"
}

variable "ami_id" {
    type = string
    description = "ami-0889a44b331db0194"
}

variable "instance_type" {
    type = string
    description = "t2.micro"
}

variable "vpc_security_group_ids" {
    type = string
    description = ""
}