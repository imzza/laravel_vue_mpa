##Laravel VueJs Multi Page Starter Kit

### Laravel Mix Configuration

To run project in a sub directory update the path in **webpack.mix.js** to the name of your directory in webpack config public path.

### Install laravel and Npm dependices

Install the laravel and npm dependices using the follwing commands.

Laravel: **composer update**
Npm: **npm install**

### Database Settings

Now update the database settings in the .env file create a databse using navicate/phpmyadmin and update the APP_URL for correct paths.

Now run **php artisan migrate** to generate table schemas.

### Install Laravel Passport
Now install laravel passoprt by running **php artisan passport:install** this will generate passport clients.

#Laravel Passport Keys
Run php artisan passport:install to generate passport keys


### Run Application

Now run **npm run watch** for compiling vuejs files and visite your broser and check all up and running.


## License

The Starter Kit is Designed and developed by Techleadz


Package Control Messages
========================

GitGutter
---------

  1.11.0:
  =======
  
    This release drops support for ST2 and ST3 before build 3176.
  
    The release 1.10.3 was archived and will be available for older releases
    of Sublime Text, but it won't receive any updates anymore.
  
    The main functional change which comes with this release is a dedicated
    worker thread to run all git commands in. This change makes sure not to
    cause GUI locks if a git command takes a little longer.
  
    ---------------------------------------------------------------------------
  
     C H A N G E L O G
  
    Enhancement:
     - Use dedicated worker thread for async tasks
     - Better submodule reloading
  
    Internal:
     - Drop support for Sublime Text ST2 and ST3 pre-releases
  
  
  💛 Git Gutter? Want to support development?
  
  I've teamed up with Wes Bos to offer the following discounts:
  
  +------------------------------------------------+
  |                                                |
  |   Use the coupon code GITGUTTER for $10 off    |
  |                                                |
  +------------------------------------------------+
  
  🏅 ⭐ ES6 ⭐
  
  👉 ES6.io/friend/GITGUTTER
  
  🏅 ⭐ Sublime Text Book ⭐
  
  👉 SublimeTextBook.com/friend/GITGUTTER
  
  🏅 ⭐ React For Beginners ⭐
  
  👉 ReactForBeginners.com/friend/GITGUTTER
  
  
  Join 15,000 other developers already learning with Wes Bos.
  
  These are fantastic resources - 100% money back guarantee! 🌟
