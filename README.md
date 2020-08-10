# Best Seat API

## What does this API?

It is a simple application find the best seat (close to front and middle) in an event.

When you create an event you have to specify how many row and columns of chair the event will have and then the API will be able to find and show the best seat available.

## How to run?

To run this application you just need to run some commands to prepare the database and start the server.

```
rake db:create db:migrate

rails s -p 4000
```
