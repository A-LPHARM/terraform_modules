variable "instance_type" {
  description = "db.t2.micro"
}

variable "engine" {
  description = "mysql"
}

variable "engine_version" {
  description = "8.0.32"
}

variable "db_name" {
  description = "projt_database1"
  type        = string
}

variable "db_username" {
  description = "Admin"
  type        = string
}

variable "db_password" {
  description = "He5n4rypha7r2m6a5cy51ED"
  type        = string
}

variable "storage" {
  description = "RDS storage in GB"
  default     = 200
}

variable "storage_type" {
  description = "RDS storage type"
  default     = "gp3"
}

variable "privatesubnet1" {
  description = "private subnet ids to launch RDS in"
  default     = []
}

variable "privatesubnet2" {
  description = "private subnet ids to launch RDS in"
  default     = []
}

variable "multi_az" {
  description = "create a standby db instance"
  default = false
}

variable "henryproject" {}