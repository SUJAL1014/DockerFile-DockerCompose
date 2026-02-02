FROM python:3.11-slim

# Install nginx
RUN apt-get update && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Install python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app files
COPY app.py .
COPY uwsgi.ini .
COPY nginx.conf  /etc/nginx/conf.d/default.conf

# Expose nginx port
EXPOSE 80

# Start uWSGI + Nginx
CMD ["sh", "-c", "uwsgi --ini uwsgi.ini & nginx -g 'daemon off;'"]
