FROM php:8.3-fpm

# Installation des dépendances système
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libicu-dev \
    unzip \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Installation de Node.js 20.x
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Installation des extensions PHP essentielles pour Symfony
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    opcache \
    pdo \
    pdo_mysql \
    intl \
    zip \
    gd

# Installation d'APCu
RUN pecl install --force apcu && docker-php-ext-enable apcu

# Installation de Xdebug (optionnel pour dev)
RUN pecl install --force xdebug && docker-php-ext-enable xdebug

# Copie de la config PHP personnalisée
COPY php.ini /usr/local/etc/php/php.ini

# Définir le répertoire de travail
WORKDIR /var/www/html

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Exposition du port PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]