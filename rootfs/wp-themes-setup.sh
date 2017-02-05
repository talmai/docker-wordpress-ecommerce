#!/bin/bash

function setup_wp_themes {
    sudo -u www-data wp --path=/var/www/html core install --url=$WORDPRESS_SITE_URL --title="HELLO" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL
    sudo -u www-data wp --path=/var/www/html option update siteurl $WORDPRESS_SITE_URL
    sudo -u www-data wp --path=/var/www/html option update home $WORDPRESS_HOME
    sudo -u www-data wp --path=/var/www/html option update blogname "$WORDPRESS_SITE_TITLE"
    sudo -u www-data wp --path=/var/www/html option update blogdescription "$WORDPRESS_SITE_DESCRIPTION"
    sudo -u www-data wp --path=/var/www/html theme install storefront 
    sudo -u www-data wp --path=/var/www/html theme activate storefront
    sudo -u www-data wp --path=/var/www/html plugin install woocommerce --activate

#    sudo -u www-data wp --path=/var/www/html theme install https://github.com/MONEI/WooCommerce/archive/master.zip --activate
    
#    sed -i -e "s/__TEST_CHANNEL_ID__/$MONEI_TEST_CHANNEL_ID/g" /monei-settings.json
#    sed -i -e "s/__TEST_USER_ID__/$MONEI_TEST_USER_ID/g" /monei-settings.json
#    sed -i -e "s/__TEST_USER_PASSWORD__/$MONEI_TEST_PASSWORD/g" /monei-settings.json

#    sed -i -e "s/__LIVE_CHANNEL_ID__/$MONEI_LIVE_CHANNEL_ID/g" /monei-settings.json
#    sed -i -e "s/__LIVE_USER_ID__/$MONEI_LIVE_USER_ID/g" /monei-settings.json
#    sed -i -e "s/__LIVE_USER_PASSWORD__/$MONEI_LIVE_PASSWORD/g" /monei-settings.json

#    sed -i -e "s/__OPERATION_MODE__/$MONEI_OPERATION_MODE/g" /monei-settings.json

#    sudo -u www-data wp --path=/var/www/html option update woocommerce_monei_settings --format=json < /monei-settings.json
#    sudo -u www-data wp --path=/var/www/html option update woocommerce_gateway_order --format=json < /woocommerce-gateway-order.json

    sudo -u www-data wp --path=/var/www/html theme install /mystile.zip --activate
}

# MONEI related variables
#export MONEI_OPERATION_MODE=${MONEI_OPERATION_MODE:-"test"}

#export MONEI_TEST_CHANNEL_ID=${MONEI_TEST_CHANNEL_ID:-""}
#export MONEI_TEST_USER_ID=${MONEI_TEST_USER_ID:-""}
#export MONEI_TEST_PASSWORD=${MONEI_TEST_PASSWORD:-""}

#export MONEI_LIVE_CHANNEL_ID=${MONEI_LIVE_CHANNEL_ID:-""}
#export MONEI_LIVE_USER_ID=${MONEI_LIVE_USER_ID:-""}
#export MONEI_LIVE_PASSWORD=${MONEI_LIVE_PASSWORD:-""}

# Wordpress related variables 
export WORDPRESS_ADMIN_USER=${WORDPRESS_ADMIN_USER:-"admin"}
export WORDPRESS_ADMIN_PASSWORD=${WORDPRESS_ADMIN_PASSWORD:-"adminadmin"}
export WORDPRESS_ADMIN_EMAIL=${WORDPRESS_ADMIN_EMAIL:-"my@email.com"}
export WORDPRESS_SITE_TITLE=${WORDPRESS_SITE_TITLE:-"My Woocommerce store"}
export WORDPRESS_SITE_DESCRIPTION=${WORDPRESS_SITE_DESCRIPTION:-"With WooCommerce + Theme preinstalled"}
export WORDPRESS_SITE_URL=${WORDPRESS_SITE_URL:-"http://localhost:8080"}
export WORDPRESS_HOME=${WORDPRESS_HOME:-"http://localhost:8080"}

setup_wp_themes
