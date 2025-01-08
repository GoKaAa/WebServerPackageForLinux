#!/bin/bash

# Update package list
sudo apt-get update -y

# Install Apache2 and PHP
sudo apt-get install apache2 -y
sudo apt install libapache2-mod-php -y

# Set permissions for /var/www/html
sudo chown www-data: /var/www/html

# Install MariaDB and PHP MySQL module
sudo apt install mariadb-server php-mysql -y

# Configure MariaDB
sudo mysql <<EOF
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost' WITH GRANT OPTION;
EXIT;
EOF

# Install phpMyAdmin
sudo apt-get install phpmyadmin -y

# Add phpMyAdmin configuration to Apache
sudo bash -c 'echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf'

# Restart Apache to apply changes
sudo /etc/init.d/apache2 restart

# Done!
echo "Setup complete! Apache, PHP, MariaDB, and phpMyAdmin are installed and configured."
