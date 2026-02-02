FROM python:3.11-slim

# Install system deps
RUN apt-get update && apt-get install -y nginx gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install uWSGI explicitly
RUN pip install uwsgi

# Copy app + configs
COPY app.py .
COPY uwsgi.ini .
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD sh -c "uwsgi --ini uwsgi.ini & nginx -g 'daemon off;'"
