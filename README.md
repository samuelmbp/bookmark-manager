# bookmark-manager

## User stories
``` shell
As a user 
So that can see all the bookmarks
I want to see a list of the bookmarks

As a user 
So I can save important information
I would like to add new bookmarks

As a user 
So I can remove a bookmark 
I would like to delete a bookmark

As a user
So I can change my bookmarks 
I would like to update my bookmarks

As a user 
So I can save additional information
I would like to comment on bookmarks

As a user 
So I can easily categorise my bookmarks
I would like to add tags to my bookmarks

As a user
So I can find relevant bookmarks
I would like to filter bookmarks by tag 

As a user
So my bookmarks are private 
I would like to only see my bookmars
```

## Setting up the database
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the production database using the pqsl command \c bookmark_manager;
4. Run the queries saved in the db/migration folder


## How to run the tests
1. Clone this repository
2. ```cd``` into the cloned directory
3. Run ```bundle``` to install the dependencies
4. Run ```rspec```