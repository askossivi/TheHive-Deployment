# Input Variables
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-2"
}

variable "instance_type" {
  description = "EC2 Instance Type - Instance Sizing"
  type = string
  default = "t2.medium"
  #default = "t2.small"
}