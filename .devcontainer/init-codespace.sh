#
sudo chmod o+rw /etc/apache2/sites-available/000-default.conf

# Start up mysql and initialize dev user.
sudo service mysql start
#
sudo mysql -u root<<EOFMYSQL
    CREATE DATABASE IF NOT EXISTS \`app\` /*\!40100 DEFAULT CHARACTER SET utf8mb4 */;
    CREATE USER IF NOT EXISTS 'app'@'%' IDENTIFIED BY 'app'; 
    GRANT ALL PRIVILEGES ON \`app\`.* TO 'app'@'%';
    FLUSH PRIVILEGES;
EOFMYSQL

# Copy over xdebug config
sudo cp .devcontainer/xdebug.ini /etc/php/7.4/cli/conf.d/20-xdebug.ini

# Start up apache.
sudo apachectl start

# Download Adminer
sudo rm -f /var/www/html/index.html
sudo wget --no-check-certificate https://www.adminer.org/static/download/4.8.1/adminer-4.8.1.php -O /var/www/html/index.php
