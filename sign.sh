#!/bin/sh

# generate site private key
openssl genrsa -out key 4096
# generate CSR using site private key
openssl req -new -key key -out csr

# requires a ext file
# openssl x509 -req -in csr -CA ~/myCA.pem -CAkey ~/myCA.key -CAcreateserial -out crt -days 1825 -sha256 -extfile ext

# create certificate
openssl x509 -req -in csr -CA ~/myCA.pem -CAkey ~/myCA.key -CAcreateserial -out crt -days 1825 -sha256

