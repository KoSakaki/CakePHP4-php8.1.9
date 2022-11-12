# image
FROM php:8.1.9-apache

# Set php.ini
COPY ./php.ini /usr/local/etc/php/

# Set apache conf (Before tag:5.4-apache)
# COPY ./apache2.conf /etc/apache2/
# COPY ./sites/*.conf /etc/apache2/sites-available/

RUN apt-get update && \
  apt-get install -y libicu-dev libpq-dev libzip-dev zlib1g-dev zip unzip libonig-dev && \
  docker-php-ext-install pdo_mysql intl zip pcntl mbstring mysqli

COPY --from=composer /usr/bin/composer /usr/bin/composer

# Set apache conf (After tag:5.5-apache)
ENV APACHE_DOCUMENT_ROOT /var/www/html
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN a2enmod rewrite \
  && service apache2 restart
