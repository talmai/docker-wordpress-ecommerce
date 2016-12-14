#!/bin/bash
set -e
function setup_monei {
    echo 'Setting up monei'
    echo $WORDPRESS_HOME
    #wp option update home $WORDPRESS_HOME --allow-root
    echo 'Setting up monei 2'
    #wp option update siteurl $WORDPRESS_SITE_URL --allow-root
    wp theme install storefront --allow-root && wp theme activate storefront --allow-root
    curl -o MONEI_WooCommerce.zip https://github.com/MONEI/WooCommerce/archive/master.zip
    wp plugin install MONEI_WooCommerce.zip --activate --allow-root
    wp plugin install woocommerce --activate --allow-root
    wp option add woocommerce-monei-settings --format=json '{ "enabled": "yes", "operation_mode": "test", "title": "MONEI Payment gateway", "description": "Pay via MONEI payment gateway.", "test_credentials": "", "test_channel_id": "__MONEI_CHANNEL_ID__", "test_user_id": "__MONEI_USER_ID__", "test_password": "__MONEI_USER_PASSWORD__", "live_credentials": "", "channel_id": "", "user_id": "", "password": "", "widget_style": "card", "card_supported": { 0: "AMEX", 1: "JCB", 2: "MAESTRO", 3: "MASTER", 4: "VISA" } }' --allow-root 
}

# MONEI related variables
export MONEI_CHANNEL_ID=${MONEI_CHANNEL_ID:-"my_monei_channel_id"}
export MONEI_USER_ID=${MONEI_USER_ID:-"my_monei_user_id"}
export MONEI_PASSWORD=${MONEI_PASSWORD:-"my_monei_password"}
export WORDPRESS_HOME=${WORDPRESS_HOME:-"http://localhost"}
export WORDPRESS_SITE_URL=${WORDPRESS_SITE_URL:-"http://localhost"}

setup_monei