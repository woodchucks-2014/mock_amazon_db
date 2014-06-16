require "sqlite3"

database = SQLite3::Database.open "amazon.db"

## TESTS

def assert(statement)
  if yield
    puts ":)"
  else
    puts statement + " FAILED"
  end
end

assert "There should be users in the database" do
  database.execute("SELECT * FROM users").count > 0
end

## Find all books published by X publisher

database.execute("SELECT * FROM books")
database.execute("SELECT * FROM reviews")
database.execute("SELECT * FROM orders")
database.execute("SELECT * FROM users")
database.execute("SELECT * FROM authors")
database.execute("SELECT * FROM publishers")

author_ids = database.execute("SELECT id FROM authors;")
test_author = author_ids[5]
puts database.execute("SELECT * FROM books WHERE author_id = ?", test_author)


## Find all reviews on a certain book
## Find all reviews by a certain user
## Find all books written by a certain author
## Find all reviews on book X with rating > 4

