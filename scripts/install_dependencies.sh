#!/bin/bash
if ! [ -x "$(command -v httpd)" ]; then yum install -y httpd24 >&2;   exit 1; fi
# install apache if not already installed

# Install PHP 7.1
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
# Install Apache 2.4
sudo yum install -y httpd mariadb-server

sudo systemctl start httpd

sudo systemctl enable httpd

sudo systemctl is-enabled httpd