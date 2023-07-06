#!/bin/bash
cd /var/www/html
yum install wget -y
wget https://getcomposer.org/composer.phar
php /var/www/html composer.phar install
