#!/bin/bash

export TF_VAR_linode_API_token="$(<~/.API_tokens/linode_terraform_token)"
export TF_VAR_ssh_public_key="$(<~/.ssh/id_ed25519.pub)"
export TF_VAR_root_password="$(openssl rand --base64 16)"