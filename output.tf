output "encrypted_password" {
    value = "${module.aws_user.encrypted_password}"
}

output "id" {
    value = "${module.aws_user.id}"
}