output "dell_mini_name" {
    value = "service account: ${google_service_account.server.display_name}, with email:  ${google_service_account.server.email} created"
}

output "key_pair_name" {
    value ="key name: ${google_service_account_key.server_access.name}"
}

output "key_pair_private" {
    value ="private key: ${google_service_account_key.server_access.private_key}"
    sensitive = true
}

output "key_pair_public" {
    value ="public key: ${google_service_account_key.server_access.public_key}"
}