FROM larvata/laravel-elite-image:3.7.1-php8.4

ARG INSTALL_NPM=false
RUN if [ ${INSTALL_NPM} = true ]; then \
  apk add --update nodejs npm \
;fi

# Composer install
COPY composer.* /tmp/
RUN cd /tmp && COMPOSER_MEMORY_LIMIT=-1 composer install --no-dev --no-autoloader

# Copy project
COPY --chown=www-data:www-data ./ /var/www
RUN cd /var/www \
    && rm -f .gitlab-ci.yml .gitattributes .gitignore Dockerfile docker-compose.example.yml Makefile README.md \
    package.json package-lock.json webpack.mix.js composer.lock server.php phpunit.xml .editorconfig .env.example \
    && rm -rf .git .gitlab docs \
    && chmod -R ug+rwx storage bootstrap/cache

# # Composer load
RUN rm -rf /var/www/vendor && mv /tmp/composer.lock /var/www/composer.lock && mv /tmp/vendor/ /var/www && composer dump-autoload
