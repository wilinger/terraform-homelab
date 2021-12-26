#------------------------------------------------------------------------------
# The best practice is to use remote state file and encrypt it since your
# state files may contains sensitive data (secrets).
#------------------------------------------------------------------------------
terraform {
    backend "local" {
      # path
  }
}


# Use Vault provider
provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables:
  #    - VAULT_ADDR
  #    - VAULT_TOKEN
  #    - VAULT_CACERT
  #    - VAULT_CAPATH
  #    - etc.  
}
