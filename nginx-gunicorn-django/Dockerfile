FROM python:3.11-slim

# Install nginx
RUN apt-get update && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Django project
COPY . .


# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Gunicorn (background) + Nginx (foreground)
CMD gunicorn myproject.wsgi:application --bind 127.0.0.1:8000 & \
    nginx -g "daemon off;"
