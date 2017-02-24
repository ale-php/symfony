FROM php:7.0-apache
MAINTAINER Alexandre E Souza <alexandre@indev.net.br>

RUN apt-get update \
    && apt-get install -y \
        zlib1g-dev \
        nano \
        vim \
        git \
        cron \
    && a2enmod rewrite remoteip

RUN a2enmod rewrite
RUN docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) pdo pdo_mysql bcmath

#COPY ./files/000-default.conf /etc/apache2/sites-enabled/000-default.conf
