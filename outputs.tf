output "key_size" {
  value = "${var.key_size}"
}
output "key_algorithm" {
  value = "${var.key_algorithm}"
}
output "key_path" {
  value = "${var.key_path}"
}
output "key_awskeyname" {
  value = "${var.key_name}"
}
output "privat_key_pem" {
  value = "${tls_private_key.new_key.private_key_pem}"
}
output "public_key_openssh" {
  value = "${tls_private_key.new_key.public_key_openssh}"
}
output "public_key_pem" {
  value = "${tls_private_key.new_key.public_key_pem}"
}
