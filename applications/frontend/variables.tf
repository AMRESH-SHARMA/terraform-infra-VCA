#Provisioner
variable "aws_region" {
  type = string
}

variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "security_group_ingress_ports" {
  type = list(number)
}

#EC2
variable "ec2_ami" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "ec2_key_name" {
  type = string
}


variable "ec2_key_local_path" {
  type = string
}

variable "ec2_tag_name" {
  type = string
}
