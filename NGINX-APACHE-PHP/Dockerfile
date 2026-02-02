FROM php:8.2-fpm

# Install nginx & apache
RUN apt-get update && apt-get install -y \
    nginx \
    apache2 \
    && a2enmod proxy proxy_fcgi rewrite setenvif \
    && rm -rf /var/lib/apt/lists/*

# ---------------- PHP-FPM (TCP) ----------------
RUN sed -i 's|listen = .*|listen = 9000|' /usr/local/etc/php-fpm.d/www.conf

# ---------------- Apache (listen on 8080) ----------------
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf

RUN echo '<VirtualHost *:8080>\n\
    DocumentRoot /var/www/html\n\
    <Directory /var/www/html>\n\
        AllowOverride All\n\
        Require all granted\n\
    </Directory>\n\
    <FilesMatch \\.php$>\n\
        SetHandler "proxy:fcgi://127.0.0.1:9000"\n\
    </FilesMatch>\n\
</VirtualHost>' > /etc/apache2/sites-available/app.conf

RUN a2dissite 000-default.conf && a2ensite app.conf

# ---------------- Nginx (reverse proxy) ----------------
RUN rm -f /etc/nginx/sites-enabled/default \
 && echo 'server {\n\
    listen 80;\n\
    server_name localhost;\n\
    location / {\n\
        proxy_pass http://127.0.0.1:8080;\n\
        proxy_set_header Host $host;\n\
        proxy_set_header X-Real-IP $remote_addr;\n\
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n\
    }\n\
}' > /etc/nginx/sites-enabled/default

# ---------------- App ----------------
WORKDIR /var/www/html
COPY index.php .

EXPOSE 80

# ---------------- Start stack ----------------
CMD php-fpm -D \
 && apachectl start \
 && nginx -g "daemon off;"
