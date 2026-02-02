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

COPY /apache/app.conf /etc/apache2/sites-enabled/app.conf

RUN a2dissite 000-default.conf 

# ---------------- Nginx (reverse proxy) ----------------
COPY /nginx/default.conf /etc/nginx/sites-enabled/default

# ---------------- App ----------------
WORKDIR /var/www/html
COPY index.php .

EXPOSE 80

# ---------------- Start stack ----------------
CMD php-fpm -D \
 && apachectl start \
 && nginx -g "daemon off;"
