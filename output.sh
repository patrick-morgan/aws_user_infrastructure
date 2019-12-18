#!/bin/sh

./terraform output encrypted_password > encodedpassword.txt
base64 --decode encodedpassword.txt > decodedpassword.txt
gpg --decrypt decodedpassword.txt > passwd.txt
./terraform output id > id.txt
printf "\nPassword: "
cat passwd.txt
printf "\nUsername: "
cat id.txt

