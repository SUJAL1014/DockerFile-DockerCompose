FROM php:8.2-fpm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    apache2 \
    nginx \
    curl \
    && apt-get clean

# Enable Apache modules
RUN a2enmod proxy proxy_http proxy_fcgi rewrite

# Change nginx to 8080
RUN sed -i 's/listen 80;/listen 8080;/' /etc/nginx/sites-enabled/default

# Clean default sites
#RUN rm -f /etc/nginx/sites-enabled/default

# Apache → Nginx config
COPY apache/app.conf /etc/apache2/sites-enabled/000-default.conf

# Nginx → PHP-FPM config
COPY nginx/nginx.conf /etc/nginx/sites-enabled/default

# PHP app
COPY hello.php /var/www/html

EXPOSE 80

CMD php-fpm -D \
    && nginx \
    && apachectl -D FOREGROUND
