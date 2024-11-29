#!/bin/bash

# SSL directories and files
SSL_DIR="/etc/ssl/certs"
CERT_FILE="$SSL_DIR/nginx-selfsigned.crt"
KEY_FILE="$SSL_DIR/nginx-selfsigned.key"

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout KEY_FILE -out CERT_FILE