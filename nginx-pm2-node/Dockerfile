# Small base image
FROM node:18-alpine

#  Install nginx + bash
RUN apk add --no-cache nginx bash \
    && mkdir -p /run/nginx

#  Install PM2 globally
RUN npm install -g pm2

#  Set working directory
WORKDIR /app

#  Copy dependency files first (cache optimization)
COPY package*.json ./

#  Install ONLY production dependencies
RUN npm ci --only=production

#  Copy application source code
COPY . .

#  Copy nginx config
COPY nginx.conf /etc/nginx/http.d/default.conf

#  Expose port
EXPOSE 80

#  Start PM2 + Nginx
CMD ["sh", "./start.sh"]
