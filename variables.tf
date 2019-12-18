variable "aws_region" {
  default = "us-east-1"
}

variable "creds_profile" {
  default = "{INSERT NAME OF CREDS}"
}

// Name of new IAM user
variable "name" {
  default = "{INSERT USER NAME}"
}

// Name of group (or groups) to add new user to
variable "group_name" {
  default = "{INSERT GROUP NAME}"
}

// DONT TOUCH THIS. THIS WILL BE FILLED IN AUTOMATICALLY BY JENKINS.
variable "pgp_key" {
  default = ""
}