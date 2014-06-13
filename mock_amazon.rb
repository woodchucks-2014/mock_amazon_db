## PLAN OF ATTACK 
## Update SQL file to be readable by SQLlite3 
## Import file 
## use Faker gem to generate information for each of the tables
## Write queries to address questions

## TESTS
## Find all books published by X publisher
## Find all reviews on a certain book
## Find all reviews by a certain user
## Find all books written by a certain author
## Find all reviews on book X with rating > 4 

require "sqlite3"
require "faker"

database = SQLite3::Database.open "database.db"

fake_user_names = []
user_email = []
user_password = []
user_username = []

fake_author_names = []

book_titles = []
genres = ["Horror", "Romance", "Teen", "Sci Fi", "Mystery", "Fiction", "Non-fiction"] # 7 genres

review_ratings = [1,2,3,4,5]
review_content = []

100.times do ## people
	fake_user_names << Faker::Name.name 
	user_email = Faker::Internet.email
	user_password = Faker::Internet.password
	user_username = Faker::Internet.user_name
end

50.times do ## authors
	fake_author_names << Faker::Name.name
end

200.times do ## books
	book_titles << Faker::Lorem.word
end


20.times do ## publishers
	fake_companies << Faker::Company.name
end

50.times do ## reviews
	review_content << Faker::Lorem.sentence
end


## UPDATING USERS
# for i in 0...100
# 	database.execute("INSERT INTO users (name, email, password, username, updated_at, created_at) VALUES (?, ?, ?, ?, datetime('now'), datetime('now'))",
# 	 [fake_names[i], email[i], password[i], username[i]])
# end

## UPDATING PUBLISHERS
# for i in 0...100
# 	database.execute("INSERT INTO publishers (name, updated_at, created_at) VALUES (?, datetime('now'), datetime('now'))",
# 	 [fake_companies[i]])
# end
# p database.execute("SELECT * FROM publishers")


## UPDATING AUTHORS
# publisher_id = database.execute("SELECT id FROM publishers")
# for i in 0...100
# 	database.execute("INSERT INTO authors (publisher_id, updated_at, created_at) VALUES (?, datetime('now'), datetime('now'))", (publisher_id[i].first))
# end
p database.execute("SELECT publisher_id FROM authors")


