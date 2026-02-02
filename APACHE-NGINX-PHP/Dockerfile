FROM php:8.2-fpm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    apache2 \
    nginx \
    curl \
    && apt-get clean

# Enable required Apache modules
RUN a2enmod proxy proxy_http proxy_fcgi proxy_connect rewrite

# PHP-FPM
RUN sed -i 's|listen = .*|listen = 9000|' /usr/local/etc/php-fpm.d/www.conf

# ---------- NGINX ----------
# Remove default
RUN rm -f /etc/nginx/sites-enabled/default

# Copy nginx vhost
COPY nginx/default.conf /etc/nginx/sites-available/default.conf

# Enable site
RUN ln -s /etc/nginx/sites-available/default.conf \
          /etc/nginx/sites-enabled/default.conf

# ---------- APACHE ----------
# Copy Apache vhost
COPY apache/app.conf /etc/apache2/sites-available/app.conf

# Disable default and enable app
RUN a2dissite 000-default.conf && a2ensite app.conf

# ---------- APP ----------
WORKDIR /var/www/html
COPY hello.php .

EXPOSE 80

CMD php-fpm -D && \
    nginx & \
    exec apache2ctl -D FOREGROUND
