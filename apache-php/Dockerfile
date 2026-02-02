# Official PHP image with Apache
FROM php:8.2-apache

# Enable Apache rewrite module (very common in real apps)
RUN a2enmod rewrite

# Copy PHP files into Apache web root
COPY . /var/www/html/

# Set correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose Apache port
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]
