
FROM larvata/laravel-elite-image:3.7.3-php8.4 AS build 

# Composer install
COPY composer.*  ./ 
RUN COMPOSER_MEMORY_LIMIT=-1 composer install --no-dev --no-autoloader   --prefer-dist  --no-interaction


FROM larvata/laravel-elite-image:3.7.3-php8.4

# Composer install
# COPY composer.* /tmp/ 
COPY --chown=www-data:www-data ./ /var/www
COPY --from=build /var/www/composer.*  /var/www/
COPY --from=build /var/www/vendor/  /var/www/vendor/
RUN composer dump-autoload

# Copy project

RUN cd /var/www \
    && rm -f .gitlab-ci.yml .gitattributes .gitignore Dockerfile docker-compose.example.yml Makefile README.md \
    package.json package-lock.json webpack.mix.js composer.lock server.php phpunit.xml .editorconfig .env.example \
    && rm -rf .git .gitlab docs \
    && chmod -R ug+rwx storage bootstrap/cache

# # Composer load

