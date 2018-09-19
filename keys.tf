resource "tls_private_key" "new_key" {
  algorithm = "${var.key_algorithm}"
  rsa_bits = "${var.key_size}"
}
resource "local_file" "privateKeyFile" {
  content  = "${tls_private_key.new_key.private_key_pem}"
  filename = "${var.key_path}/${var.key_name}.key.pem"
}
resource "local_file" "publicKeyFileOpenSsh" {
  content  = "${tls_private_key.new_key.public_key_openssh}"
  filename = "${var.key_path}/${var.key_name}_openssh.pub"
}
resource "local_file" "publicKeyFile" {
  content  = "${tls_private_key.new_key.public_key_pem}"
  filename = "${var.key_path}/${var.key_name}.pem"
}
resource "local_file" "privateKeyFile_docker" {
  count = "${var.key_dockerkeys ? 1 : 0}"
  content  = "${tls_private_key.new_key.private_key_pem}"
  filename = "${var.key_path}/docker/key.pem"
}
resource "local_file" "publicKeyFile_docker" {
  count = "${var.key_dockerkeys ? 1 : 0}"
  content  = "${tls_private_key.new_key.public_key_pem}"
  filename = "${var.key_path}/docker/cert.pem"
}
resource "aws_key_pair" "keypair_aws" {
  count = "${var.key_register ? 1 : 0}"
  key_name = "${var.key_name}"
  public_key = "${tls_private_key.new_key.public_key_openssh}"
}
