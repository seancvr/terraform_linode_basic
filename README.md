# Deploy basic cloud VM instance to Linode with Terraform
This repository contains the Terraform configuration files and simple shell scripts to automate the deployment of a simple virtual machine instance to Linode cloud. 

## Deployment steps

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

In order to keep secrets out of .tf files, they are set as environment variables. Prefixing the environemt variables with TF_VAR_ allows terraform to automatically assign them the corresponding variables declared in variables.tf.
e.g. TF_VAR_linode_API_token is assigned to the variable with the name "linode_API_token".

### Initialize Terraform configuration and deploy resources
Terraform specifies a core workflow for initializing and deploying resources using the CLI. 

First run the **init** command. This configures the backend, installs providers and providers and modules,  and creates the terraform.lock.hcl version lockfile.

```
terraform init
```

This is optional but I like the **fmt** command to tidy up the format of my configuration files.
```
terraform fmt
```

Also optional but useful is the **validate** command. This command checks whether the configuration is syntactically valid and internally consistent, before terraform reaches out to any external provider API's.
```
terrafrom validate
```

The next required command is **plan**. This creates an execution plan to deploy your specified resources, and lets you preview the changes that Terraform plans to make to your infrastructure.
```
terraform plan
```

The **plan** command executes actions proposed in the Terraform plan. Once executed Terraform will connect to Linode API and request the provisioning of the specified resources. After minute or two resources should be visible in Linode dashboard.
```
terraform apply
```

## Connect to virtual machine instance
As per the out the **output.tf** file, the instance id and IP address should be output to the the terminal once complete. Use the IP address to connect to the newly created cloud machine.
```bash
ssh root@<instance ip address>
```


## Deprovision resources
If you no longer need to linode instance and want to clean up, simply run the **destroy** command, and the resources will be deprovisioned. 
```
terraform destroy
```

Finally if you want to unset the environment variables initialized earlier, use the unset.sh script.
```bash
source ./unset.sh
```




