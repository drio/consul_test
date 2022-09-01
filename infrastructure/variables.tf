variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "terraform-example-instance"
}

variable "ami" {
  description = "The ami to use for the instances"
  type        = string
  default     = "ami-02f3416038bdb17fb"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

