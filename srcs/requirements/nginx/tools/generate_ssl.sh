#!/bin/bash

# SSL directories and files
SSL_DIR="/etc/nginx/ssl"
CERT_FILE="$SSL_DIR/nginx-selfsigned.crt"
KEY_FILE="$SSL_DIR/nginx-selfsigned.key"

# Ensure Nginx is running and the domain is accessible
# Start Nginx in the background to handle HTTP-01 challenge
service nginx start

# Request a certificate from Let’s Encrypt using Certbot
# Replace `your-domain.com` with your actual domain
certbot --nginx --agree-tos --no-eff-email --email your-email@example.com -d your-domain.com

# Restart Nginx to apply SSL certificates
service nginx restart

# Optional: Clean up by stopping Nginx if desired (for non-production environments)
# service nginx stop
