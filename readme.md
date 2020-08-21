##Techleadz Laravel VueJs Multi Page Starter Kit

### Laravel Mix Configuration

To run project in a sub directory update the path in **webpack.mix.js** to the name of your directory in webpack config public path.

### Install laravel and Npm dependices

Install the laravel and npm dependices using the follwing commands.

Laravel: **composer update**
Npm: **npm install**

### Database Settings

Now update the database settings in the .env file create a databse using navicate/phpmyadmin and update the APP_URL for correct paths.

Now run **php artisan migrate**  and **php artisan db:seed** to generate table schemas ans dumy data.
**php artisan migrate** to generate table schemas.

### Run Application

Now run **npm run watch** for compiling vuejs files and visite check your laravel application on Xampp on localhost/appname/

### Demo User Accounts
User Account: 
Email: test@test.com
Password: password

Admin Account:
Email: admin@test.com
Password: password

## License

The Starter Kit is Designed and developed by Techleadz
