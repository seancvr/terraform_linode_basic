variable "label" {
  type    = string
  default = "ubuntuBox"
}

variable "region" {
  type    = string
  default = "us-central"
}

variable "type" {
  type    = string
  default = "g6-standard-1"
}

variable "linode_API_token" {
  type        = string
  description = "my linode API key"
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

variable "os_version" {
  type    = string
  default = "linode/ubuntu22.04"
}




