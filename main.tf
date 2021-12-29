terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "zencluster"
    workspaces {
      name = "terraform-homelab"
    }
  }
}

provider "vault" {
}
