#!/bin/bash
# yum install wget -y
# wget https://getcomposer.org/composer.phar
# php /usr/bin/php composer.phar install
export COMPOSER_ALLOW_SUPERUSER=1
composer install --ignore-platform-req=php -d /var/www/html/
