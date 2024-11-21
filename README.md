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

## Seed the Database (Optional only if you want to generate a random users)

<code> php artisan db:seed --class=UsersTableSeeder</code>

## Start the Laravel Development Server

<code>php artisan serve</code>

## Accessing via API Endpoints
<p>Register</p>
<code> GET http://localhost:8000/api/register</code>

##
<p>Login </p>
<code> GET http://localhost:8000/api/login</code>
##
<p>Get Your Login Details using the bearer Token Generated  </p>
<code> GET http://localhost:8000/api/user</code>
##
<p>Get all registered users  </p>
<code> GET http://localhost:8000/api/get/users</code>


<code> POST http://localhost:8000/api/users/store</code>

<code>Body (JSON):
{
    "name": "John Doe",
    "email": "john.doe@example.com",
    "password": "secret"
}</code>




Unit Tests and Additional Considerations:

    Running Unit Tests: Execute PHPUnit tests with php artisan test to ensure code quality and functionality.

