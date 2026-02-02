#!/bin/sh

echo "Starting PM2..."
pm2-runtime ecosystem.config.js &

    echo "Starting Nginx..."
    nginx -g "daemon off;"

