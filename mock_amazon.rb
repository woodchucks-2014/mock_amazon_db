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

fake_companies = []
fake_names = []
email = []
password = []
username = []

100.times do 
	# fake_names << Faker::Name.name 
	fake_companies << Faker::Company.name
	# email << Faker::Internet.email
	# password << Faker::Internet.password
	# username << Faker::Internet.user_name
end
# p fake_names
# p email
# p password
# p username
# p fake_companies

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


## UPDATING 

