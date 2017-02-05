# docker-wordpress-ecommerce
This [repository](https://github.com/talmai/docker-wordpress-ecommerce) contains the Dockerfile for the autobuild of docker-wordpress-ecommerce docker image, which is a Wordpress image with e-Commerce capabilities providing [WooCommerce](https://github.com/woocommerce/woommerce).

---

This image requires you to have a running MySQL container.

    docker run --name wordpressdb -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -d mysql:5.7

The Dockerfile uses the official WordPress image:

    docker run --name wordpress-ecommerce --link wordpressdb:mysql -d -v "$PWD/wp_folder":/var/www/html \
    -p 8080:80 talmai/wordpress-ecommerce

Or via `docker-compose`

    docker-compose up

Running this image will give you a empty Wordpress instance, if you want to perform an unattended installation you just need to run:
    
    docker exec <containername> wp-themes-setup [-e ...]

Which will install default themes to WooCommerce as well.

Wait for it to initialize completely, and visit `http://localhost:8080` or `http://host-ip:8080`.

### Customization

This image supports all the configuration variables provided in the official Docker WordPress [ReadMe](https://github.com/docker-library/docs/tree/master/wordpress), including:

**-e WORDPRESS_DB_HOST=...** (defaults to the IP and port of the linked mysql container)

**-e WORDPRESS_DB_USER=...** (defaults to "root")

**-e WORDPRESS_DB_PASSWORD=...** (defaults to the value of the MYSQL_ROOT_PASSWORD environment variable from the linked mysql container)

**-e WORDPRESS_DB_NAME=...** (defaults to "wordpress")

**-e WORDPRESS_TABLE_PREFIX=...** (defaults to "", only set this when you need to override the default table prefix in wp-config.php)

**-e WORDPRESS_AUTH_KEY=...**, **-e WORDPRESS_SECURE_AUTH_KEY=...**, **-e WORDPRESS_LOGGED_IN_KEY=...**, **-e WORDPRESS_NONCE_KEY=...**, **-e WORDPRESS_AUTH_SALT=...**, **-e WORDPRESS_SECURE_AUTH_SALT=...**, **-e WORDPRESS_LOGGED_IN_SALT=...**, **-e WORDPRESS_NONCE_SALT=...** (default to unique random SHA1s)

If the `WORDPRESS_DB_NAME` specified does not already exist on the given MySQL server, it will be created automatically upon startup of the wordpress container, provided that the `WORDPRESS_DB_USER` specified has the necessary permissions to create it.

As well as extra Wordpress variables to customize the installation:

**-e WORDPRESS_ADMIN_USER=...**: The name of the admin user, by default *admin*.

**-e WORDPRESS_ADMIN_PASSWORD=...**: The password for the admin user, by default *adminadmin*.

**-e WORDPRESS_ADMIN_EMAIL=...**: The email for the admin user, by default *my@example.com*.

**-e WORDPRESS_SITE_TITLE=...**: The Wordpress site name, by the default it will be *My Woocommerce store*.

**-e WORDPRESS_SITE_DESCRIPTION=...**: The Wordpress site description or slogan, by default it will be *With MONEI preinstalled*.

**-e WORDPRESS_SITE_URL=...**: By default *http://localhost*.

**-e WORDPRESS_HOME=...**: By default *http://localhost*.

## Extensions enabled

Besides `Apache mod_rewrite enabled`, this also includes:

```
// print_r( get_loaded_extensions() );

Array
(
    [0] => Core
    [1] => date
    [2] => libxml
    [3] => openssl
    [4] => pcre
    [5] => sqlite3
    [6] => zlib
    [7] => ctype
    [8] => curl
    [9] => dom
    [10] => fileinfo
    [11] => filter
    [12] => ftp
    [13] => hash
    [14] => iconv
    [15] => json
    [16] => mbstring
    [17] => SPL
    [18] => PDO
    [19] => session
    [20] => posix
    [21] => Reflection
    [22] => standard
    [23] => SimpleXML
    [24] => pdo_sqlite
    [25] => Phar
    [26] => tokenizer
    [27] => xml
    [28] => xmlreader
    [29] => xmlwriter
    [30] => mysqlnd
    [31] => apache2handler
    [32] => apcu
    [33] => calendar
    [34] => exif
    [35] => gd
    [36] => gettext
    [37] => gmagick
    [38] => mysqli
    [39] => pdo_mysql
    [40] => soap
    [41] => sockets
    [42] => wddx
    [43] => xsl
    [44] => Zend OPcache
)
```

---

## License
docker-wordpress-ecommerce is available under the MIT license. See the LICENSE file for more info.

## Credits
Forked from [MONEI](https://github.com/MONEI/wordpress-monei) and initially developed by [microapps](http://microapps.com/)
