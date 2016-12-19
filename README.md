# wordpress-monei
This [repository](https://github.com/MONEI/wordpress-monei) contains the Dockerfile for the autobuild of wordpress-monei docker image, which is a Wordpress image with e-Commerce capabilities providing Woocommerce and [MONEI](https://monei.net/) **Payment Gateway**.

## What you will get
An official Wordpress to create a Store, fully customizable along with the MONEI Payment Gateway and Woocommerce plugins included.

## How
The Dockerfile uses the official WordPress image and adds MONEI, Woocommerce and a setup script.

    docker run --name <containername> monei/wordpress-monei

## Usage
Running this image will give you a empty Wordpress instance, if you want to perform an unattended installation you just need to run:
    
    docker exec <containername> wp-monei-setup [-e ...]

Providing the variables documented in the Customization section. 

## Customization
We support all the configuration variables provided in the official Docker WordPress [ReadMe](https://github.com/docker-library/docs/tree/master/wordpress). 
But also we add some more:

### MONEI related variables

**MONEI_CHANNEL_ID**: Your MONEI Channel ID.

**MONEI_USER_ID**: Your MONEI User ID.

**MONEI_PASSWORD**: Your MONEI User Password.


### Extra Wordpress variables to customize the installation

**WORDPRESS_ADMIN_USER**: The name of the admin user, by default *admin*.

**WORDPRESS_ADMIN_PASSWORD**: The password for the admin user, by default *adminadmin*.

**WORDPRESS_ADMIN_EMAIL**: The email for the admin user, by default *my@example.com*.

**WORDPRESS_SITE_TITLE**: The Wordpress site name, by the default it will be *My Woocommerce store*.

**WORDPRESS_SITE_DESCRIPTION**: The Wordpress site description or slogan, by default it will be *With MONEI preinstalled*.

**WORDPRESS_SITE_URL**: By default *http://localhost*.

**WORDPRESS_HOME**: By default *http://localhost*.


## Contributing
Contributions are always welcome!

## Credits
Developed by [microapps](http://microapps.com/)

## License
<<<<<<< 326425d22fed556577523daec90915a07aff5b01
docker-wordpress-monei is available under the MIT license. See the LICENSE file for more info.
=======
wordpress-monei is available under the MIT license. See the LICENSE file for more info.
>>>>>>> Updating names
