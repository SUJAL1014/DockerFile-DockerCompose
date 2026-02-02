# Use Python slim
FROM python:3.11-slim


# Install dependencies
RUN apt-get update && apt-get install -y \
    nginx \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements & install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Copy nginx config
COPY nginx/default.conf /etc/nginx/sites-enabled/default

# Make start script executable
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose port 80
EXPOSE 80

# Run start script
CMD ["/start.sh"]
