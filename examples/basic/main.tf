terraform {
  required_version = ">= 1.5.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.60.0"
    }
  }
}

variable "ssh_public_key" {
  description = "SSH public key content"
  type        = string
}

resource "hcloud_ssh_key" "default" {
  name       = "default"
  public_key = var.ssh_public_key
}

module "server" {
  source = "github.com/dark-vex/terraform-hetzner-server?ref=v1.0.0"

  name        = "example-server"
  server_type = "cx22"
  image       = "debian-12"
  location    = "nbg1"
  backups     = true

  ssh_key_ids = [hcloud_ssh_key.default.id]

  labels = {
    environment = "example"
    managed-by  = "terraform"
  }
}
