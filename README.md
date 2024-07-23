<h1>TEST APP </h1>

<h3>Step-by-Step Guide for Setting Up TestApp
</h3>

## Create MySQL Database

<code> CREATE DATABASE TestApp;</code>

## Configure Environment Variables

<code> cp .env.example .env</code>

<code> DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=TestApp
DB_USERNAME=root
DB_PASSWORD=</code>

## Install Composer Dependencies

<code> composer install</code>

## Generate Application Key

<code> php artisan key:generate</code>

## Migrate Database

<code> php artisan migrate</code>

## Seed the Database

<code> php artisan db:seed --class=UsersTableSeeder</code>

## Start the Laravel Development Server

<code>php artisan serve</code>

## Accessing Users via API Endpoints

<code> GET http://localhost:8000/api/users</code>

## Store a New User

<code> POST http://localhost:8000/api/users/store</code>

<code>Body (JSON):
{
    "name": "John Doe",
    "email": "john.doe@example.com",
    "password": "secret"
}</code>




Unit Tests and Additional Considerations:

    Running Unit Tests: Execute PHPUnit tests with php artisan test to ensure code quality and functionality.

