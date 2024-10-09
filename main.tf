# configure linode provider from Terraform registry
terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.29.0"
    }
  }

  # Set API token
}
provider "linode" {
  token = var.linode_API_token
}

# Create linode resource
resource "linode_instance" "basicVM" {
  image           = var.os_version       //optional
  label           = var.label            //options
  region          = var.region           //required
  type            = var.type             //required
  authorized_keys = [var.ssh_public_key] //optional
  root_pass       = var.root_password    //optional
  firewall_id     = 955709               //attach instance to existing firewall
}