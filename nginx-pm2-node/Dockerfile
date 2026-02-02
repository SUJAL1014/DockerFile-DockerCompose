# 1 Base image
FROM node:18-bullseye

# 2 Install Nginx
RUN apt-get update \
 && apt-get install -y nginx \
 && rm -rf /var/lib/apt/lists/*

 # 3 Set working directory
WORKDIR /app

# 4 Copy package files first (cache optimization)
COPY package*.json ./

# 5 Install Node dependencies
RUN npm install


# 6 Copy application source code
COPY . .

# 7 Copy Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 8 Expose port 80
EXPOSE 80

# 9 Start PM2 + Nginx
CMD ["./start.sh"]



