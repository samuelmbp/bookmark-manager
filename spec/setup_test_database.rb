require 'pg'

p 'Setting up the test database...'

connection = PG.connect(dbname: 'bookmark_manager_test')
connection.exec('TRUNCATE TABLE bookmarks;')