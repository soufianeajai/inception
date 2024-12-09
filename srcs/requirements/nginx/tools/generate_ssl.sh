#!/bin/sh

SSL_DIR="/etc/ssl/certs"
CERT_FILE="$SSL_DIR/nginx-selfsigned.crt"
KEY_FILE="$SSL_DIR/nginx-selfsigned.key"

mkdir -p $SSL_DIR $SSL_DIR

if [ -f "$CERT_FILE" ] || [ -f "$KEY_FILE" ]; then
    echo "Certificate or key file already exists. Aborting."
    exit 1
fi

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEY_FILE -out $CERT_FILE -subj "/C=MA/CN=sajaite.42.fr" > /dev/null 2>&1

chmod 600 $KEY_FILE
chmod 644 $CERT_FILE

echo "SSL certificate and key generated successfully."
