#!/bin/bash

sudo apt-get update
sudo apt-get install -y php libapache2-mod-php php-mysql php-curl php-mbstring php-gd php-xml php-xmlrpc php-intl php-soap php-zip
sudo a2enmod rewrite
sudo chown -Rf www-data:www-data /var/www/html
#sudo echo Kalin >> /var/www/html/index.html
#sudo echo "Title: Linux namespaces
#Body:
#
#Namespaces are a feature of the Linux kernel that partitions kernel resources such that one set of processes sees one set of resources while another set of processes sees a different set of resources. The feature works by having the same namespace for these resources in the various sets of processes, but those names referring to distinct resources. Examples of resource names that can exist in multiple spaces, so that the named resources are partitioned, are process IDs, hostnames, user IDs, file names, and some names associated with network access, and interprocess communication.
#
#Namespaces are a fundamental aspect of containers on Linux.
#
#The term "namespace" is often used for a type of namespace (e.g. process ID) as well for a particular space of names.
#
#A Linux system starts out with a single namespace of each type, used by all processes. Processes can create additional namespaces and join different namespaces." > /var/www/html/index.html
sudo wget https://wp-db-config.s3.us-east-2.amazonaws.com/wpbootstrap/VarWww.tar.gz -P /var/tmp
sudo tar -xvzf /var/tmp/VarWww.tar.gz -C /
sudo chown -Rf www-data:www-data /var/www/html
sudo rm -f /var/www/html/index.html
sudo /bin/sed -i "s/localhost/${database_address}/g" /var/www/html/wp-config.php
sudo service apache2 restart
