#----------------------------------------------------------
# Vault policies
#----------------------------------------------------------

resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("policies/admins.hcl")
}

resource "vault_policy" "ansible" {
  name   = "ansible"
  policy = file("policies/ansible.hcl")
}

resource "vault_policy" "argocd" {
  name   = "argocd"
  policy = file("policies/argocd.hcl")
}
