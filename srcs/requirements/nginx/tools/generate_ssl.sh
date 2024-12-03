#!/bin/sh

SSL_DIR="/etc/ssl/certs"
CERT_FILE="$SSL_DIR/nginx-selfsigned.crt"
KEY_FILE="$SSL_DIR/nginx-selfsigned.key"

openssl req -new -newkey rsa:2048 -nodes -keyout $KEY_FILE -out $CERT_FILE -subj "/C=MA/CN=sajaite.42.fr"
