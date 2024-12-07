#!/bin/sh
set -e



sed -i 's/bind 127.0.0.1 -::1/bind 0.0.0.0 ::/g' /etc/redis.conf
sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf

echo "requirepass ${REDIS_PW}" >> /etc/redis.conf



exec redis-server /etc/redis.conf
