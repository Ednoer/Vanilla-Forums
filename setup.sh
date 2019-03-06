#!/bin/bash

sudo apt update
sudo apt install apache2


sudo systemctl stop apache2.service
sudo systemctl start apache2.service
sudo systemctl enable apache2.service


sudo apt-get install mariadb-server mariadb-client


sudo systemctl stop mysql.service
sudo systemctl start mysql.service
sudo systemctl enable mysql.service


sudo systemctl stop mariadb.service
sudo systemctl start mariadb.service
sudo systemctl enable mariadb.service


sudo mysql_secure_installation


# Enter current password for root (enter for none): Just press the Enter
# Set root password? [Y/n]: Y
# New password: Enter password
# Re-enter new password: Repeat password
# Remove anonymous users? [Y/n]: Y
# Disallow root login remotely? [Y/n]: Y
# Remove test database and access to it? [Y/n]:  Y
# Reload privilege tables now? [Y/n]:  Y


sudo mysql -u root -p


sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php


sudo apt update


sudo apt install php7.2 libapache2-mod-php7.2 php7.2-common php7.2-gmp php7.2-curl php7.2-intl php7.2-mbstring php7.2-xmlrpc php7.2-mysql php7.2-gd php7.2-xml php7.2-cli php7.2-zip


sudo nano /etc/php/7.2/apache2/php.ini


# file_uploads = On
# allow_url_fopen = On
# short_open_tag = On
# memory_limit = 256M
# upload_max_filesize = 100M
# max_execution_time = 360
# date.timezone = America/Chicago


sudo systemctl restart apache2.service


sudo mysql -u root -p


CREATE DATABASE vanilla;


CREATE USER 'vanillauser'@'localhost' IDENTIFIED BY 'new_password_here';


GRANT ALL ON vanilla.* TO 'vanillauser'@'localhost' IDENTIFIED BY 'user_password_here' WITH GRANT OPTION;


FLUSH PRIVILEGES;
EXIT;


sudo apt install curl git
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer


cd /var/www/html
sudo git clone --branch release/2.7 https://github.com/vanilla/vanilla.git
cd /var/www/html/vanilla
sudo composer install


sudo chown -R www-data:www-data /var/www/html/vanilla/
sudo chmod -R 755 /var/www/html/vanilla/


sudo nano /etc/apache2/sites-available/vanilla.conf


# <VirtualHost *:80>
#         ServerAdmin admin@example.com
#         DocumentRoot /var/www/html/vanilla
#         ServerName example.com
#         ServerAlias www.example.com

#         <Directory /var/www/html/vanilla/>
#             Options +FollowSymlinks
#             AllowOverride All
#             Require all granted
#         </Directory>

#         ErrorLog ${APACHE_LOG_DIR}/error.log
#         CustomLog ${APACHE_LOG_DIR}/access.log combined

# </VirtualHost>


sudo a2ensite vanilla.conf
sudo a2enmod rewrite


sudo systemctl restart apache2.service
