#!/bin/bash

sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q -y install mysql-server
sudo /bin/sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo wget https://wp-db-config.s3.us-east-2.amazonaws.com/wpbootstrap/wordpress.sql -P /var/tmp
sudo /usr/bin/mysql -uroot < /var/tmp/wordpress.sql   
sudo wget https://wp-db-config.s3.us-east-2.amazonaws.com/wpbootstrap/WP_CLI_EXPORT.sql -P /var/tmp 
sudo /usr/bin/mysql -u root < /var/tmp/WP_CLI_EXPORT.sql
sudo systemctl enable mysql.service
sudo systemctl start mysql.service
sudo systemctl restart mysql.service
