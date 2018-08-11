#!/bin/sh

# generate site private key and csr
openssl req -out csr -new -newkey rsa:4096 -nodes -keyout key

# requires a ext file
# openssl x509 -req -in csr -CA ~/myCA.pem -CAkey ~/myCA.key -CAcreateserial -out crt -days 1825 -sha256 -extfile ext

# create certificate
openssl x509 -req -in csr -CA ~/myCA.pem -CAkey ~/myCA.key -CAcreateserial -out crt -days 1825 -sha256

