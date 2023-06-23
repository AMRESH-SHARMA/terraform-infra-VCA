provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "security_group" {
  source = "../../modules/aws_sg"
  # Inject sg group env variables to aws_ec2 module
  security_group_name          = "frontend_sg"
  security_group_description   = "security group for frontend ec2 instance"
  security_group_ingress_ports = var.security_group_ingress_ports
}

# output "security_group_output" {
#   value = module.security_group.id
# }

module "ec2_key_pair" {
  source   = "../../modules/aws_kp"
  ec2_key_name = var.ec2_key_name
  ec2_key_local_path = var.ec2_key_local_path
}

module "ec2" {
  source = "../../modules/aws_ec2"
  # Inject ec2 variables to frontend_ec2 module
  ec2_ami           = var.ec2_ami
  ec2_instance_type = var.ec2_instance_type
  ec2_tag_name      = var.ec2_tag_name
  # Inject vpv_id which is output from security_group module
  security_group_vpc_id = module.security_group.id
  security_group        = "security_group"
  ec2_key_name          = module.ec2_key_pair.key_name
}

/*
When the instance is restarted, its IP address changes every time.
An Elastic IP (EIP) is a static public IP address provided by Amazon Web Services (AWS) that can be associated with an EC2 instance or a Network Load Balancer.
*/

# Generate EIP
resource "aws_eip" "ec2_eip" {
  domain   = "vpc"               
}

# Associate EIP with EC2 Instance
resource "aws_eip_association" "ec2_eip_association" {
  instance_id   = module.ec2.instance_id
  allocation_id = aws_eip.ec2_eip.id
}