#!/bin/bash

function setup_wp_monei {
    sudo -u www-data wp --path=/var/www/html core install --url=$WORDPRESS_SITE_URL --title="HELLO" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL
    sudo -u www-data wp --path=/var/www/html option update siteurl $WORDPRESS_SITE_URL
    sudo -u www-data wp --path=/var/www/html option update home $WORDPRESS_HOME
    sudo -u www-data wp --path=/var/www/html option update blogname "$WORDPRESS_SITE_TITLE"
    sudo -u www-data wp --path=/var/www/html option update blogdescription "$WORDPRESS_SITE_DESCRIPTION"
    sudo -u www-data wp --path=/var/www/html theme install storefront 
    sudo -u www-data wp --path=/var/www/html theme activate storefront
    sudo -u www-data wp --path=/var/www/html plugin install woocommerce --activate

    sudo -u www-data wp --path=/var/www/html plugin install https://github.com/MONEI/WooCommerce/archive/master.zip --activate

    sed -i -e "s/__CHANNEL_ID__/$MONEI_CHANNEL_ID/g" /monei-settings.json
    sed -i -e "s/__USER_ID__/$MONEI_USER_ID/g" /monei-settings.json
    sed -i -e "s/__USER_PASSWORD__/$MONEI_PASSWORD/g" /monei-settings.json

    sudo -u www-data wp --path=/var/www/html option update woocommerce-monei-settings --format=json < /monei-settings.json
}

# MONEI related variables
export MONEI_CHANNEL_ID=${MONEI_CHANNEL_ID:-""}
export MONEI_USER_ID=${MONEI_USER_ID:-""}
export MONEI_PASSWORD=${MONEI_PASSWORD:-""}
export WORDPRESS_ADMIN_USER=${WORDPRESS_ADMIN_USER:-"admin"}
export WORDPRESS_ADMIN_PASSWORD=${WORDPRESS_ADMIN_PASSWORD:-"adminadmin"}
export WORDPRESS_ADMIN_EMAIL=${WORDPRESS_ADMIN_EMAIL:-"my@example.com"}
export WORDPRESS_ADMIN_PASSWORD=${WORDPRESS_SITE_TITLE:-"My Woocommerce store"}
export WORDPRESS_SITE_DESCRIPTION=${WORDPRESS_SITE_DESCRIPTION:-"With MONEI preinstalled"}
export WORDPRESS_SITE_URL=${WORDPRESS_SITE_URL:-"http://localhost"}
export WORDPRESS_HOME=${WORDPRESS_HOME:-"http://localhost"}

setup_wp_monei