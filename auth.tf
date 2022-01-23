# Enable userpass backend
resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

# Enable approle backend
resource "vault_auth_backend" "approle" {
  type = "approle"
}

# Create ansible approle
resource "vault_approle_auth_backend_role" "ansible" {
  backend        = vault_auth_backend.approle.path
  role_name      = "ansible"
  token_policies = ["ansible"]
}

# Create argocd approle
resource "vault_approle_auth_backend_role" "argocd" {
  backend        = vault_auth_backend.approle.path
  role_name      = "argocd"
  token_policies = ["argocd"]
}

# Mount vault ssh ca path
resource "vault_mount" "ssh" {
  type = "ssh"
  path = "ssh-client-signer"
}

# Enable vault ssh ca and generate signing key
resource "vault_ssh_secret_backend_ca" "ssh" {
  backend              = vault_mount.ssh.path
  generate_signing_key = true

}

# SSH role configs for clientrole
resource "vault_generic_endpoint" "clientrole" {
  depends_on           = [vault_ssh_secret_backend_ca.ssh]
  path                 = "ssh-client-signer/roles/clientrole"
  ignore_absent_fields = true
  data_json            = <<EOT
{
  "allow_user_certificates": true,
  "allowed_users": "*",
  "allowed_extensions": "permit-pty,permit-port-forwarding",
  "default_extensions": [

    {
      "permit-pty": ""
    }
  ],
  "key_type": "ca",
  "default_user": "ansible",
  "algorithm_signer": "rsa-sha2-512",
  "ttl": "30m0s"
}
EOT
}

