#!/bin/bash

# install apache if not already installed

yum -y remove httpd* php*

# Install PHP 7.1
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.4 php7.4
# Install Apache 2.4
sudo yum install -y httpd mariadb-server

sudo systemctl start httpd

sudo systemctl enable httpd

sudo systemctl is-enabled httpd

if [ ! -f "/usr/local/bin/composer" ]; then
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php --install-dir=/usr/bin --filename=composer
    php -r "unlink('composer-setup.php');"
else
    /usr/local/bin/composer self-update --stable --no-ansi --no-interaction
fi
