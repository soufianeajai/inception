#!/bin/sh

/usr/local/bin/generate_ssl.sh

exec nginx -g "daemon off;"

echo "nginx started successfully"
