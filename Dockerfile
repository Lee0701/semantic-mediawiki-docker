FROM mediawiki:1.39.3

# install missung stuff and php extensions
RUN apt-get update && apt-get install -y \
      vim \
      unzip \
      libzip-dev \
    && docker-php-ext-install zip

# install composer
RUN curl -o /usr/local/bin/composer https://getcomposer.org/download/2.5.7/composer.phar && chmod +x /usr/local/bin/composer

# update mediawiki extensions via composer
COPY composer.local.json .
RUN composer update --no-dev

