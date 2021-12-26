#------------------------------------------------------------------------------
# The best practice is to use remote state file and encrypt it since your
# state files may contains sensitive data (secrets).
#------------------------------------------------------------------------------
terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "zencluster"
    workspaces {
      name = "terraform-homelab"
    }
  }
}

# Use Vault provider
provider "vault" {
}
