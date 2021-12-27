# variable "ZEN_PASS" {
#   description = "User password"
#   type        = string
#   sensitive   = true
# }

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_auth_backend" "approle" {
  type = "approle"
}

# Create a user, 'zenuser'
# resource "vault_generic_endpoint" "zenuser" {
#   depends_on           = [vault_auth_backend.userpass]
#   path                 = "auth/userpass/users/zenuser"
#   ignore_absent_fields = true
#   data_json            = <<EOT
# {
#   "policies": ["admins"],
#   "password": "${var.ZEN_PASS}"
# }
# EOT
# }

resource "vault_approle_auth_backend_role" "ansible" {
  backend        = vault_auth_backend.approle.path
  role_name      = "ansible"
  token_policies = ["ansible"]
}

