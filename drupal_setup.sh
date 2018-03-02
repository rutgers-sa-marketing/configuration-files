#!/bin/sh
echo "So you want a local Drupal Development server set up for you, huh?"
echo "Let's begin. . ."
# Check if mySQL is already installed and install if necessary
echo "Let me set up your Drupal database and user credentials. . ."
mysql -uroot -e "create database drewdev character set utf8 collate utf8_general_ci;create user 'sadrupaldev'@'localhost' identified by 'sadrew2018';grant all privileges on drewdev.* to 'sadrupaldev'@'localhost';flush privileges;use drewdev;"
echo "Boo-yah! Now let's get Drupal set up."
mkdir ~/Desktop/dev-drupal
echo "Downloading a stable release of Drupal. . ."
curl -L http://ftp.drupal.org/files/projects/drupal-7.57.tar.gz | tar -xz - -C ~/Desktop/dev-drupal --strip-components=1
echo "Got it! Now it just needs to be configured. . ."
# Keep our credentials saved and updated on the office github page: 
curl -o ~/Desktop/dev-drupal/wp-config.php https://raw.githubusercontent.com/fullstackman/studentaffairs-wp-theme/master/page.php
echo "Let's launch drupal and see if it works. . ."
cd ~/Desktop/dev-drupal
# The output of these ampersands are kinda obtrusive
# php -S 127.0.0.1:5601 &
echo "Thank you for your patience."
echo "If you encountered any issues during this installation, please report to your supervisor with a copy of the records found in ~/mySQL/data/mysql.err"
