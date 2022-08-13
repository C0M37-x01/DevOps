# create a main.tf file with following content

	provider "aws" {
		region = "us-east-1"
		  #Configuration Options
	}
# save this file with .tf extension
# now run command

1. "terraform init" # This command will Initialize provider plugins
# Terraform has created a lock file .terraform.lock.hcl record the provider selections it made above.
# Creates ".terraform" & ".terraform.lock.hcl"
# you can find provider and version in this path 
.terraform/providers/registry.terraform.io/hashicorp/aws/4.25.0/darwin_amd64/terraform-provider-aws_v4.25.0_x5


2. "terraform validate" #It'll check if the configuration is valid or not
	provider "aws" {
		region = "us-east-2"
		access_key = "access-key"
		secret_key = "secret-key"
	}

  
	resource "aws_instance" "Webserver" {
		aws_ami = "ami-id"
		instance_type = "instance-type"
		tags = {
			"Name" = "Terraform-Instance"
			}
	}

3. "terraform plan" # This command will execute plan based on configuration

4. "terraform apply" # This command will do work of "plan, validate and destroy"
# perform all actions mentioned in plan


5. "terraform destroy" # This command destroys/deletes all configurations mentioned in plan. 
	- This command will create "terraform.tfstate" file and 
      "terraform.tf.state.backup"
	- Terraform must store state about your managed infrastructure and 
      configuration. 
	- This state is used by Terraform to map real world resources to your 
      configuration, keep track of metadata, and to improve performance for 
      large infrastructures.
