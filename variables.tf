variable "os_version" {
  type    = string
  default = "linode/ubuntu22.04"
}

variable "label" {
  type    = string
  default = "ubuntuBox"
}

variable "region" {
  type    = string
  default = "us-central"
}

# see available types: https://api.linode.com/v4/linode/types
variable "type" {
  type    = string
  default = "g6-standard-1"
}

variable "linode_API_token" {
  type        = string
  description = "linode API token"
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "ssh public key"
  sensitive   = true
}

variable "root_password" {
  type        = string
  description = "root user password"
  sensitive   = true
}

# find firewall id: https://api.linode.com/v4/linode/types
variable "firewall_id" {
  type        = string
  description = "cloud firewall id"
  sensitive   = true
}




