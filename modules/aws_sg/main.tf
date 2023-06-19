resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_description
# dynamic generated block inbound traffic
  dynamic "ingress" {
    for_each = var.security_group_ingress_ports
    content {
      # description = "TLS from VPC"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
# outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
