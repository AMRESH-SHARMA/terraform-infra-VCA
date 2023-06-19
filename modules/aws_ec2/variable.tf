# EC2
variable "ec2_ami" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "ec2_tag_name" {
  type = string
}

variable "security_group_vpc_id" {
  type = string
}

variable "security_group" {
  type = string
}
