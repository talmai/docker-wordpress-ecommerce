# docker-wordpress-ecommerce
This [repository](https://github.com/talmai/docker-wordpress-ecommerce) contains the Dockerfile for the autobuild of docker-wordpress-ecommerce docker image, which is a Wordpress image with e-Commerce capabilities providing [WooCommerce](https://github.com/woocommerce/woommerce) and [MONEI](https://monei.net/) **Payment Gateway**.

---

The Dockerfile uses the official WordPress image and adds MONEI, WooCommerce and a setup script.

    docker run --name <containername> talmai/wordpress-ecommerce

---

## Usage
Running this image will give you a empty Wordpress instance, if you want to perform an unattended installation you just need to run:
    
    docker exec <containername> wp-monei-setup [-e ...]

Providing the variables documented in the Customization section. 

## Customization
We support all the configuration variables provided in the official Docker WordPress [ReadMe](https://github.com/docker-library/docs/tree/master/wordpress). 
But also we add some more:

### MONEI related variables

**MONEI_OPERATION_MODE**: Your MONEI operation mode. (live/test), by default *test*.

**MONEI_TEST_CHANNEL_ID**: Your MONEI test Channel ID.

**MONEI_TEST_USER_ID**: Your MONEI test User ID.

**MONEI_TEST_PASSWORD**: Your MONEI test User Password.

**MONEI_LIVE_CHANNEL_ID**: Your MONEI live Channel ID.

**MONEI_LIVE_USER_ID**: Your MONEI live User ID.

**MONEI_LIVE_PASSWORD**: Your MONEI live User Password.

### Extra Wordpress variables to customize the installation

**WORDPRESS_ADMIN_USER**: The name of the admin user, by default *admin*.

**WORDPRESS_ADMIN_PASSWORD**: The password for the admin user, by default *adminadmin*.

**WORDPRESS_ADMIN_EMAIL**: The email for the admin user, by default *my@example.com*.

**WORDPRESS_SITE_TITLE**: The Wordpress site name, by the default it will be *My Woocommerce store*.

**WORDPRESS_SITE_DESCRIPTION**: The Wordpress site description or slogan, by default it will be *With MONEI preinstalled*.

**WORDPRESS_SITE_URL**: By default *http://localhost*.

**WORDPRESS_HOME**: By default *http://localhost*.

## License
docker-wordpress-ecommerce is available under the MIT license. See the LICENSE file for more info.

## Credits
Forked from [MONEI](https://github.com/MONEY/wordpress-monei) and initially developed by [microapps](http://microapps.com/)
