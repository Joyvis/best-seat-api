# Best Seat API

## What does this API?

It is a simple application find the best seat (close to front and middle) in an event.

When you create an event you have to specify how many row and columns of chair the event will have and then the API will be able to find and show the best seat available.

## What technologies were applyed here?

The application has whole business layer created using the gem interactor to organize and apply some clean architecture concepts.

All the data validations were created both in database and models to prevent any possible gap.

The tests are covering 100% of application.

## How to run?

To run this application you just need to run some commands to prepare the database and start the server.

```
rake db:create db:migrate

rails s -p 4000
```
