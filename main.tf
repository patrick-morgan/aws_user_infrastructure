module "aws_user" {
  source = "./module"

  name       = "${var.name}"
  group_name = "${var.group_name}"
  pgp_key = "${var.pgp_key}"
}


terraform {
  backend "s3" {
    encrypt = true

    bucket = "{INSERT BUCKET NAME}"
    region = "us-east-1"

    // CHANGE THE STATE
    key = ""
  }
}

provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.creds_profile}"
}