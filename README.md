# aws_user_infrastructure
A repo to store all of the terraform code for aws user creation

# Terraform AWS User Creation Template

This is a template to be utilized when an AWS user needs to be created.

After copying the template to your new location, follow these steps:

# Getting Started:

## Variables:
Edit the variables.tf to reflect your user's information. 

#### Variables that MUST be updated:
`name`


## State:
Change the s3 path for state storage for your project.  If this doesn't happen, your project may overwrite another project.
```
terraform {
  backend "s3" {
    encrypt = true
    bucket = "{BUCKET-NAME}"
    region = "us-east-1"
    key = ""
  }
}
```

### Build:
`terraform init`
`terraform plan -out="{MY PLAN NAME}"`

`terraform apply "{MY PLAN NAME}"`

### Teardown:
`terraform destroy`

### Prerequisites

* Terraform v0.12+
