require './environment'

## TESTS

def assert(statement)
  if yield
    puts ":)"
  else
    puts statement + " FAILED"
  end
end

assert "There should be users in the database" do
  User.count > 0
end

assert "There should be publishers in the database" do
  Publisher.count > 0
end

assert "There should be books in the database" do
  Book.count > 0
end

assert "There should be reviews in the database" do
  Review.count > 0
end

assert "There should be orders in the database" do
  Order.count > 0
end

assert "There should be authors in the database" do
  Author.count > 0
end

## Find all books published by X publisher
## Find all reviews on a certain book
## Find all reviews by a certain user
## Find all books written by a certain author
## Find all reviews on book X with rating > 4

