/*
When u generate key-pair, it creates private and public key,
private key needs to be downloaded and public needs to shared with server.
*/

# Generates an RSA private key with a key size of 4096 bits.
resource "tls_private_key" "rsa" {
  algorithm   = "RSA"
  rsa_bits = 4096                   
}

# Shared public key which is derived from the previously created tls_private_key.rsa resource.
resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.ec2_key_name
  public_key = tls_private_key.rsa.public_key_openssh
}


# Store private key in local file
resource "local_file" "rsa_private_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename =   var.ec2_key_local_path
  file_permission  = "0777"
}

