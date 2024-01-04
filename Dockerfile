FROM php:8.1-apache

# Install xdebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Install php extensions
#RUN docker-php-ext-install ...
# Enable php extensions
#RUN docker-php-ext-enable ...

# Download composer
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        unzip \
        && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./apache.conf /etc/apache2/sites-available/000-default.conf
COPY ./packages /var/www/html

RUN chown -R www-data:www-data /var/www/html

# Port
EXPOSE 80

# Start apache
CMD ["apache2-foreground"]