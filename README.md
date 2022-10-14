This is my Bachelor's Degree project. The project is a Full Stack app (front-end in Laravel + back-end in Vue.js) and the goal of this app is to create a fully functional online car rental service.

I. The main pages of the project are:

Landing Page; Login/Sign Up Pages; Transactions Page; Renting Page; Admin Panel;

II. The main functionalities of the project:

The ability to add cars in the database by using the administrator panel, if the user is logged in with the right permissions. The ability to manage and modify the data on the website at your own will as an admin in the Admin Panel; The ability for the users to rent the actual car, that is displayed from the database, and a multiple choice varint for the number of days that the user wants to rent the car for, and the automatic calculation of the price based on the days chosen. A fully working display system for the Invoices that are generated after renting a car in the previous section.

III. The main implemented concepts of the project:

A fully working sign up and login cycle. Login and Sign Up protected by Reggex validation functions; A well-thought SQL DataBase with various data tables and pivot tables for storing cars and users related data. Most tables have relationships between each other with foreign IDs or by taking advantage of the Laravel's Eloquent Relationships; A fully functional display system for the cars, where the user can show some partial data of the cars then has the option to be redirected to another page where he can see the full detail panel along with the renting side of the cars. The user can become eligible to actually rent a car after he made an account, and he completed some extra data that can prove he got his driver's license and he can pay for the rented car. The concept of roles with different level of permissions and accesability on different pages of the website; Routing security in front-end, you cannot enter the Transactions Page unless you are logged into an account; Routing security in back-end, you cannot request certain data unless you have a certain role (example: Admin for Admin Panel) on certain pages. Data is protected by Permissions and MiddleWares; The ability to see and access an Admin Panel only as an Admin. Use of reusable components for base elements (example: Base Dialogue, Base Button, Base Badge, etc) and many more...

IV. Software requirements:

Node.js installed (17.5.0 is the used production version for the project); PHP > 8.0.0 (required in order to run Laravel 9); Composer installed (required in order to run Laravel 9); V. How to run the project:

Clone the repository; In the terminal run "npm install"; After that, in the terminal run "composer install"; Turn on your local server (example: WAMP, XAMP); Import the database named "laravel_dblicenta"; In the terminal run "cp .env.example .env"; Open the .env file and make sure the value of DB_DATABASE is the name of the database (example: 'DB_DATABASE=laravel_dblicenta'); Once all these steps have taken place, you can run in two separate terminals "npm run serve" and "php artisan serve"; The project is now fully accesible; VI. Used frameworks:

About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

Simple, fast routing engine.

Powerful dependency injection container.

Multiple back-ends for session and cache storage.

Expressive, intuitive database ORM.

Database agnostic schema migrations.

Robust background job processing.

Real-time event broadcasting.

Laravel is accessible, powerful, and provides tools required for large, robust applications.

About Vue.js

Vue is a progressive framework for building user interfaces. It is designed from the ground up to be incrementally adoptable, and can easily scale between a library and a framework depending on different use cases. It consists of an approachable core library that focuses on the view layer only, and an ecosystem of supporting libraries that helps you tackle complexity in large Single-Page Applications.

Vue.js supports all browsers that are ES5-compliant (IE8 and below are not supported).
