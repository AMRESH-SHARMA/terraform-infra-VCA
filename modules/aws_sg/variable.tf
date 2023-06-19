# security group
variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
}

variable "security_group_ingress_ports" {
  description = "List of ports to allow inbound traffic"
  type        = list(number)
}