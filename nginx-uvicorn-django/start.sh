#!/bin/bash


# Start Uvicorn in background
uvicorn myproject.asgi:application --host 0.0.0.0 --port 8000 &

# Start Nginx in foreground
nginx -g "daemon off;"
~~