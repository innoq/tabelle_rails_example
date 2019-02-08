# README

This is an example application written in Rails demonstrating how [Tabelle](https://github.com/innoq/tabelle) can work.

## Requirements

* Rails 5.1.6

## Setting it up

    bundle install
    rails db:migrate
    rails db:seed # inserts 100 random people into the db

## Deploying the app

    git push heroku

    ## to run migrations on the production server
    heroku run rails db:migrate

## Running the app

    rails server

The application is then available under http://localhost:3000