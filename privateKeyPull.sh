# Pull private key from s3 bucket and import it into gpg keychain
/root/bin/aws s3 cp s3://{BUCKET NAME}}/{PRIVATE KEY NAME} privateKey.asc
gpg --import privateKey.asc