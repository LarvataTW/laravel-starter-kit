## About  Larvata Laravel Stater Kit

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).
- [All-in-one Environment ](https://github.com/LarvataTW/laravel-elite-image)

Laravel is accessible, powerful, and provides tools required for large, robust applications.

##  How to Use

To create a new Laravel application using the Larvata Laravel Starter Kit, run the following command:

To globally install Laravel using Composer, run the following command:

```bash
composer global require laravel/installer
```

### Create Project

```bash
laravel new example-app --using=larvata/laravel-starter-kit  --phpunit --npm
```
* --pest    : Using pest 
* --phpunit : using phpunit
* --npm     : After installation, run npm install


### Create Development Environment

```bash
docker compose -f docker-compose.dev.yml up 
#docker exec -t "$(basename $(pwd))-web-1" php artisan octane:install --server=swoole
#docker exec -t "$(basename $(pwd))-web-1" composer install
#docker exec -t "$(basename $(pwd))-web-1" npm install npm
```
## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
