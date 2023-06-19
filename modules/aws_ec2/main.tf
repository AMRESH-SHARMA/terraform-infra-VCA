resource "aws_instance" "ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  tags = {
    Name = var.ec2_tag_name
  }
  # auto attach vpc_sg__group_id returned from mysql_sg resource
  vpc_security_group_ids = [var.security_group_vpc_id]
  depends_on             = [var.security_group]

}
