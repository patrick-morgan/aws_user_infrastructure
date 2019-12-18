#!/bin/bash -x
## A script for installing terraform on an ubuntu machine
TERRAFORM_VERSION="0.12.3"
DOWNLOAD_DIR="/tmp"
INSTALL_DIR="/usr/local/bin"
DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
DOWNLOADED_FILE="terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
FILE="terraform"

# Make sure correct stuff is installed  before proceeding
prerequisites() {
    echo "beginning prerequisites"

    echo "installing wget and unzip"
    apt-get update
    apt-get install wget unzip -y
}

# Install terraform
terraform_install() {
    echo "terraform install has been called"
    echo "getting terraform zip from hashicorp"

    wget "${DOWNLOAD_URL}"

    echo "Unzipping terraform.zip"
    
    unzip "$DOWNLOADED_FILE"
}

main() {
prerequisites

if [ -e "${FILE}" ]; then
    echo "terraform already installed"
else
    echo "installing terraform"
    terraform_install
fi
}

main