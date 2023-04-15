#!/bin/bash

# Generate a self-signed SSL certificate
keytool -genkeypair -alias solr-ssl \
  -keyalg RSA \
  -keysize 2048 \
  -keypass secret \
  -storepass secret \
  -validity 9999 \
  -keystore /opt/solr/server/etc/solr-ssl.keystore.jks \
  -ext SAN=DNS:localhost,IP:127.0.0.1 \
  -dname "CN=localhost, OU=Test, O=Test, L=Test, ST=Test, C=US"
  