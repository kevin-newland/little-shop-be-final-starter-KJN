# BE - Little Shop final   

Link to my GitHub.
https://github.com/kevin-newland

### Abstract:
This project is an extension of the Little Shop group project. I added functionality for merchants to create coupons for their shop.

### Context:
For this project as a total(Front End , and Back End) I had 6 days to complete. As most of the project time was spent getting the Back End functional my time on the Front End was limited. As a whole I am proud that I got the Back End and Front End functional and working properly.

### Learning Goals:
- Write migrations to create tables and relationships between tables
- Implement CRUD functionality for a resource
- Use MVC to organize code effectively, limiting the amount of logic included in serializers and controllers
- Use built-in ActiveRecord methods to join tables of data, make calculations, and group data based on one or more attributes
- Write model tests that fully cover the data logic of the application
- Write request tests that fully cover the functionality of the application

# Little Shop | Final Project | Backend Starter Repo

This repository is the completed API for use with the Mod 2 Group Project. The FE repo for Little Shop lives [here](https://github.com/turingschool-examples/little-shop-fe-vite).

This repo can be used as the starter repo for the Mod 2 final project.

## Setup

```ruby
bundle install
rails db:{drop,create,migrate,seed}
rails db:schema:dump
```

This repo uses a pgdump file to seed the database. Your `db:seed` command will produce lots of output, and that's normal. If all your tests fail after running `db:seed`, you probably forgot to run `rails db:schema:dump`. 

Run your server with `rails s` and you should be able to access endpoints via localhost:3000.
