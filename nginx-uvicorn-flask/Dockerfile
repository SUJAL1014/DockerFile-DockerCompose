# Use slim Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy Flask app
COPY app/ ./app/

# Install dependencies
RUN pip install --no-cache-dir -r app/requirements.txt

# Install Nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy Nginx config
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose only the port we want clients to access
EXPOSE 80

# Start Uvicorn + Nginx
CMD ["sh", "-c", "uvicorn app.main:asgi_app --host 0.0.0.0 --port 8000 & nginx -g 'daemon off;'"]
