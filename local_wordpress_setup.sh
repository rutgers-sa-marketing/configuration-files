#!/bin/sh
echo "So you want a local WordPress Development server set up for you, huh?"
echo "Let's begin. . ."
mkdir ~/mySQL
echo "First, I'll download mySQL for you. . ."
curl -L https://cdn.mysql.com//Downloads/MySQL-5.6/mysql-5.6.39-macos10.13-x86_64.tar.gz | tar -xz - -C ~/mySQL --strip-components=1
echo "Sweet! mySQL was downloaded onto your computer!"
echo "Initializing all the necessary files and settings. . ."
mkdir ~/mySQL/mysql-files
chmod 750 ~/mySQL/mysql-files/
~/mySQL/bin/mysqld --initialize-insecure --basedir=~/mySQL/ --console --datadir=~/mySQL/data --explicit-defaults-for-timestamp --lc-messages-dir=~/mySQL/share --log-error=~/mySQL/data/mysql.err --pid-file=~/mySQL/mysql.pid --socket=~/mySQL/thesock.sock --port=3306
echo "Success! Starting the mySQL server. . ."
~/mySQL/bin/mysqld_safe &
echo "Phew. That worked. Now let me set up your WordPress database and user credentials. . ."
~/mySQL/bin/mysql -uroot -e "create database wpdev;create user 'sawebdev'@'localhost' identified by 'sawp2018';grant all privileges on wpdev.* to 'sawebdev'@'localhost';flush privileges;use wpdev;"
echo "Boo-yah! Now let's get WordPress set up."
mkdir ~/Desktop/dev-wordpress
echo "Downloading the latest release of WordPress. . ."
curl -L http://wordpress.org/latest.tar.gz | tar -xz - -C ~/Desktop/dev-wordpress --strip-components=1
echo "Got it! Now it just needs to be configured. . ."
# Keep our credentials saved and updated on the office github page: 
curl -o ~/Desktop/dev-wordpress/wp-config.php https://raw.githubusercontent.com/fullstackman/studentaffairs-wp-theme/master/page.php
echo "Let's launch WordPress and see if it works. . ."
cd ~/Desktop/dev-wordpress
# The output of these ampersands are kinda obtrusive
php -S 127.0.0.1:8137 &
echo "Thank you for your patience."
echo "If you encountered any issues during this installation, please report to your supervisor with a copy of the records found in ~/mySQL/data/mysql.err"
