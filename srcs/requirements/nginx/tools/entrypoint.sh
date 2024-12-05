#!/bin/sh

# Generate SSL certificate if not exists
/usr/local/bin/generate_ssl.sh

# Start Nginx in foreground
exec nginx -g "daemon off;"

echo "nginx started successfully"
