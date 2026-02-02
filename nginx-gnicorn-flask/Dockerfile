# Base image with Python
FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && apt-get update \
    && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*


# Copy app and nginx config
COPY app.py .
COPY nginx.conf /etc/nginx/sites-available/default

# Expose port 80
EXPOSE 80


CMD ["sh", "-c", "gunicorn -w 4 -b 0.0.0.0:8000 app:app & nginx -g 'daemon off;'"]
