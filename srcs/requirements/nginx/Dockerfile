FROM debian:bullseye

# Install nginx, certbot, and python3-certbot-nginx
RUN apt-get update && apt-get install -y \
    nginx \
    certbot \
    python3-certbot-nginx \
    && rm -rf /var/lib/apt/lists/*

# Copy the Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copy the script that will request the SSL certificate from Certbot
COPY tools/generate_ssl.sh /usr/local/bin/generate_ssl.sh

# Make the script executable
RUN chmod +x /usr/local/bin/generate_ssl.sh

# Run the script to request the SSL certificate (Certbot will configure Nginx automatically)
RUN /usr/local/bin/generate_ssl.sh

# Expose port 443 for HTTPS
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
