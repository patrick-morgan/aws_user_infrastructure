variable "aws_region" {
    default = "us-east-1"
}

variable "creds_profile" {
    default = ""
}

// Name of new IAM user
variable "name" {
    default = ""
}

// Name of group (or groups) to add new user to
variable "group_name" {
    default = ""
}

variable "pgp_key" {
    default = ""
}