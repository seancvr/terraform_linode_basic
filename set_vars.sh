#!/bin/bash

# request firewall data from linode and store response
response=$(curl --request GET \
    --url 'https://api.linode.com/v4/networking/firewalls?page=1&page_size=100' \
    --header 'accept: application/json' \
    --header "authorization: Bearer $(<~/.API_tokens/linode_resourceQuery_token)")

# parse firewall id from response
firewall_id=$(echo $response | jq -r '.data[0].id')

# set environment variables
export TF_VAR_linode_API_token="$(<~/.API_tokens/linode_terraform_token)"
export TF_VAR_ssh_public_key="$(<~/.ssh/id_ed25519.pub)"
export TF_VAR_root_password="$(openssl rand --base64 16)"
export TF_VAR_firewall_id=$firewall_id
