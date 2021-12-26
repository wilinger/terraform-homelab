#---------------------
# Create policies
#---------------------

# Create admin policy in the root namespace
resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("policies/admins.hcl")
}

# Create 'training' policy
resource "vault_policy" "ansible" {
  name   = "ansible"
  policy = file("policies/ansible.hcl")
}
