#----------------------------------------------------------
# Enable secrets engines
#----------------------------------------------------------

# Enable K/V v2 secrets engine at 'kv-v2'
resource "vault_mount" "kv-v2" {
  path = "kv-v2"
  type = "kv-v2"
}

# Enable Transit secrets engine
resource "vault_mount" "transit" {
  path = "transit"
  type = "transit"
}

# Creating an encryption key
resource "vault_transit_secret_backend_key" "key" {
  depends_on = [vault_mount.transit]
  backend    = "transit"
  name       = "zencrypt"
  deletion_allowed = true
}
