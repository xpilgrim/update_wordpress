#!/bin/bash
wp_dir="/var/www/mydom/public_html/myblog"
wp_dir_backup="/home/myuser/my_wp"
wp_db_name="wp_mywpinstall"
NOW=$(date +"%m-%d-%Y %H:%M:%S")
DATE=$(date +"%Y-%m-%d")
echo ""
echo "wp update...".$NOW
cd $wp_dir
echo "check update..."
wp core check-update
echo "export db..."
wp db export
echo "mv db..."
mv "$wp_db_name.sql" "$wp_dir_backup/$wp_db_name.$DATE.sql"
echo "comp dir..."
tar -vczf "$wp_db_name.$DATE.gz" .
echo "mv wp dir"
mv "$wp_db_name.$DATE.gz" "$wp_dir_backup/$wp_db_name.$DATE.gz"
echo "wp update"
wp core update
echo "wp plugin update all"
wp plugin update --all
echo "finish"


