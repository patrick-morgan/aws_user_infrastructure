#!/bin/bash -x
FILE="gnupg"

# Installs gnupg (gpg)
main() {
if [ -e "${FILE}" ]; then
    echo "gpg already installed"
else
    echo "installing gpg"
     apt-get install gnupg -y
fi
}

main