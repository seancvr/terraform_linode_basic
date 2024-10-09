# Deploy basic cloud VM instance to Linode with Terraform
This repository contains the Terraform configuration files and simple shell scripts to automate the deployment of a simple virtual machine instance to Linode cloud. 

# Deployment steps

### Set Environment Variables
Run the set_vars.sh script to set the environment variables required by the Terraform configuration.
```bash
source ./set_vars.sh
```
| Variable name | Description |
|:------------|:----------|
| TF_VAR_linode_API_token | `Access token used by Terraform to connect to the Linode API` |
| TF_VAR_ssh_public_key   | `SSH public key for authentication to the Linode instance` |
| TF_VAR_root_password    | `Randomly generated root password` |

In order to keep secrets out of .tf files, they are set as environment variables. Prefixing the environemt variables with TF_VAR_ allows terraform to automatically assign them the variables declared in variables.tf
e.g. TF_VAR_linode_API_token is automatically assigned to 
```HCL
variable "linode_API_token" {
  type        = string
  description = "linode API token"
  sensitive   = true
}
```