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
<code> POST /api/register</code>

##
<p>Login </p>
<code> POST /api/login</code>

##
<p>Get Your Login Details using the bearer Token Generated  </p>
<code> GET /api/user</code>

##
<p>Get all registered users  </p>
<code> GET /api/get/users</code>

##
<p>Get Your Login Details Balance  </p>
<code> GET /api/wallet/balance </code>

##
<p>Get Your Login Details Balance  </p>
<code> GET /api/wallet/balance </code>

##
<p>Fund Your Wallet  Balance </p>
<code> POST /api/wallet/fund </code>
<code> Key: amount</code>

##
<p>Purchase Airtime From MTN, GLO, AIRTEL, 9MOBILE  </p>
<code> POST /api/purchase/airtime </code>
<code> Key: phone_number</code>
<code> Key: network_provider , value: (You must select one network MTN, GLO, AIRTEL, 9MOBILE)</code>
<code> Key: data_plan , value: (You must select data from 1GB,2GB,5GB,10GB)</code>
<code> Key: amount</code>
