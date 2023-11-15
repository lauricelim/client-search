# README

This is a simple application that offers 2 functions using command line:
1. Search through all clients and return those with names partially matching a given search query
2. Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found.

Bonus Features:
- Access the 2 functions via REST API
- Accept a different dataset file
- Search a different field instead of client name

Assumptions:
- Dataset file will always contain the same attributes (id, full_name, email)
- Database is setup for this application assuming that it will be used to scale, but not using it currently.

##### Ruby version
3.0.0

##### Configuration
- `bundle install`
- `rails db:create`

##### Access via command line
`rails r lib/query-cli.rb`

##### Access via API
`rails s` to start 
- Documentation for endpoints can be exported to Postman using client-search.postman_collection.json file
