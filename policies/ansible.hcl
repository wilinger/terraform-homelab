path "kv-v2/data/secret/ansible" {
  capabilities = ["read", "list"]
}

path "ssh-client-signer/sign/clientrole" {
  capabilities = ["create", "update"]
}