FROM php:7.0.33-fpm-jessie
RUN docker-php-ext-install mysqli pdo pdo_mysql