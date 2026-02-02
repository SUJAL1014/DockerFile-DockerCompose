FROM nginx:alpine

# Set working directory
WORKDIR /app

# Copy React build
COPY build/ ./build

# Copy nginx config

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy start script
COPY start.sh .

# Make script executable
RUN chmod +x start.sh

EXPOSE 80

ENTRYPOINT ["./start.sh"]
