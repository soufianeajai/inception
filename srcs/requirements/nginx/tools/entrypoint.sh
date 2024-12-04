#!/bin/sh

# Generate SSL certificate if not exists
/usr/local/bin/generate_ssl.sh

echo "<h1> hello from https </h1>" >> /var/www/html/index.html
# Start Nginx in foreground
exec nginx -g "daemon off;"

echo "nginx started successfully"
