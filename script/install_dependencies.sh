#!/bin/bash

# Exit on error
set -o errexit -o pipefail

# Update yum
yum update -y

# Install packages
yum install -y curl
yum install -y git

# Remove current apache & php
yum -y remove httpd* php*

# Install PHP 7.1
yum install -y php71 php71-cli php71-fpm php71-mysql php71-xml php71-curl php71-opcache php71-pdo php71-gd php71-pecl-apcu php71-mbstring php71-imap php71-pecl-redis php71-mcrypt php71-mysqlnd mod24_ssl

# Install Apache 2.4
yum -y install httpd24

# Allow URL rewrites
sed -i 's#AllowOverride None#AllowOverride All#' /etc/httpd/conf/httpd.conf

# Change apache document root


# Get Composer, and install to /usr/local/bin
if [ ! -f "/usr/local/bin/composer" ]; then
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php --install-dir=/usr/bin --filename=composer
    php -r "unlink('composer-setup.php');"
else
    /usr/local/bin/composer self-update --stable --no-ansi --no-interaction
fi

# Restart apache
service httpd start

# Setup apache to start on boot
chkconfig httpd on



