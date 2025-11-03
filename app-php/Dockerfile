FROM ubuntu:latest

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y \
    php php-fpm php-pgsql php-cli php-mbstring php-xml php-intl php-curl php-zip \
    git unzip curl composer nginx && \
    rm -rf /var/lib/apt/lists/*

# Install Yii2 basic template
RUN composer create-project --prefer-dist yiisoft/yii2-app-basic basic

# RUN chown -R www-data:www-data /var/www/html/yii2/
EXPOSE 3000

CMD service php8.3-fpm start && nginx -g "daemon off;"