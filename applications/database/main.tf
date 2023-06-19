provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "security_group" {
  source = "../../modules/aws_sg"
  # Inject sg group env variables to aws_ec2 module
  security_group_name        = "mysql_sg"
  security_group_description = "security group for MySQL ec2 instance"
  security_group_ingress_ports       = var.security_group_ingress_ports
}

# output "security_group_output" {
#   value = module.security_group.id
# }

module "ec2" {
  source = "../../modules/aws_ec2"
  # Inject ec2 variables to mysql_ec2 module
  ec2_ami           = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  ec2_tag_name      = var.ec2_tag_name
  # Inject vpv_id which is output from security_group module
  security_group_vpc_id = module.security_group.id
  security_group        = "security_group"
}
