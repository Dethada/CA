#!/bin/sh

# generate site private key
openssl genrsa -out key 4096
# generate CSR using site private key
openssl req -new -key key -out csr

# get domain and create ext file
read -p "Enter your domain name: " DOMAIN
if [ -z "$DOMAIN" ]
then
    echo "Invalid domain name"
    exit 1
else
    printf "AuthorityKeyIdentifier=keyid,issuer\nbasicConstraints=CA:FALSE\nkeyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment\nsubjectAltName = @alt_names\n\n[alt_names]\nDNS.1 = $DOMAIN\nDNS.2 = *.$DOMAIN" > ext
fi

openssl x509 -req -in csr -CA ~/myCA.pem -CAkey ~/myCA.key -CAcreateserial -out crt -days 1825 -sha256 -extfile ext
