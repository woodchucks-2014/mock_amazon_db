## PLAN OF ATTACK
## Update SQL file to be readable by SQLlite3
## Import file
## use Faker gem to generate information for each of the tables
## Write queries to address questions

require "sqlite3"
require "faker"

database = SQLite3::Database.open "amazon.db"

fake_user_names = []
user_email = []
user_password = []
user_username = []

fake_author_names = []

fake_companies = []

book_titles = []
genres = ["Horror", "Romance", "Teen", "Sci Fi", "Mystery", "Fiction", "Non-fiction"] # 7 genres
book_release_dates = []


review_ratings = [1,2,3,4,5]
review_content = []

100.times do ## people
	fake_user_names << Faker::Name.name
	user_email << Faker::Internet.email
	user_password << Faker::Internet.password
	user_username << Faker::Internet.user_name
end

50.times do ## authors
	fake_author_names << Faker::Name.name
end

200.times do ## books
	book_titles << Faker::Lorem.word
	book_release_dates << Faker::Business.credit_card_expiry_date.to_s
end

20.times do ## publishers
	fake_companies << Faker::Company.name
end

50.times do ## reviews
	review_content << Faker::Lorem.sentence
end

## UPDATING USERS
for i in 0...100
	database.execute("INSERT INTO users (name, email, password, username, updated_at, created_at) VALUES (?, ?, ?, ?, current_timestamp, current_timestamp)",
	 [fake_user_names[i], user_email[i], user_password[i], user_username[i]])
end

## UPDATING PUBLISHERS
for i in 0...20
	database.execute("INSERT INTO publishers (name, updated_at, created_at) VALUES (?, current_timestamp, current_timestamp)",
	 [fake_companies[i]])
end

## UPDATING AUTHORS
publisher_ids = database.execute("SELECT id FROM publishers") # 20

for i in 0...50
	x = publisher_ids.flatten.sample
	database.execute("INSERT INTO authors (name, publisher_id, updated_at, created_at) VALUES (?, ?, current_timestamp, current_timestamp)",
		[fake_author_names[i], x])
end

## UDPATING BOOKS
author_ids = database.execute("SELECT id FROM authors")

for i in 0...200
	database.execute("INSERT INTO books (author_id, publisher_id, title, genre, released_on, updated_at, created_at) VALUES (?, ?, ?, ?, ?, current_timestamp, current_timestamp)",
	 [author_ids.sample, publisher_ids.sample, book_titles[i], genres.sample, book_release_dates[i]])
end

## UDPATING REVIEWS
book_ids = database.execute("SELECT id FROM books")
user_ids = database.execute("SELECT id FROM users")

for i in 0...50
	database.execute("INSERT INTO reviews (book_id, user_id, rating, content, updated_at, created_at) VALUES (?, ?, ?, ?, current_timestamp, current_timestamp)",
	 [book_ids.sample, user_ids.sample, review_ratings.sample,review_content[i]])
end

## UPDATING ORDERS
for i in 0...100
	database.execute("INSERT INTO orders (book_id, user_id, author_id, publisher_id, created_at, updated_at) VALUES (?, ?, ?, ?, current_timestamp, current_timestamp)",
		[book_ids.sample, user_ids.sample, author_ids.sample, publisher_ids.sample])
end

## TESTS

## Find all books published by X publisher

test_author = author_ids[5]

database.execute("SELECT * FROM books")
database.execute("SELECT * FROM reviews")
database.execute("SELECT * FROM orders")
database.execute("SELECT * FROM users")
database.execute("SELECT * FROM authors")
database.execute("SELECT * FROM publishers")

puts database.execute("SELECT * FROM books WHERE author_id = ?", test_author)


## Find all reviews on a certain book
## Find all reviews by a certain user
## Find all books written by a certain author
## Find all reviews on book X with rating > 4

