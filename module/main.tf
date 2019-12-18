provider "aws" {
    region = "${var.aws_region}"
    profile = "${var.creds_profile}"
}