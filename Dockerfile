# Installs WordPress with MONEI plugin preinstalled
# Github Repo: https://github.com/MONEI/docker-wordpress-monei

#FROM wordpress:4.6.1-php5.6-fpm
FROM wordpress:4.6.1-php5.6-apache

# Add sudo in order to run wp-cli as the www-data user 
RUN apt-get update && apt-get install -y sudo less nano && rm -rf /var/lib/apt/lists/*


COPY rootfs /
RUN mv /wp-monei-setup.sh /bin/wp-monei-setup && chmod +x /bin/wp-monei-setup

# Add WP-CLI 
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv /bin/wp-cli.phar /bin/wp
RUN chmod +x /bin/wp


# Cleanup
RUN apt-get clean
RUN rm -rf /tmp/* /var/tmp/*