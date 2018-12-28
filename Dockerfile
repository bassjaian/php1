FROM php:7.2-apache

ENV http_proxy http://10.1.4.11:8080
ENV https_proxy http://10.1.4.11:8080

RUN apt-get update \
    && apt-get install -y vim curl mcrypt git

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer


RUN docker-php-ext-install mysqli  \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mbstring