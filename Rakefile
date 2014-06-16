require 'rake'

namespace 'db' do
  desc 'Load schema from sql'
  task :load do
    `sqlite3 amazon.db < schema.sql`
  end

  desc 'Seed database with sample data'
  task :seed => :load do
    ## PLAN OF ATTACK
    ## Update SQL file to be readable by SQLlite3
    ## Import file
    ## use Faker gem to generate information for each of the tables
    ## Write queries to address questions

    require './seeder'

    ## people
    Seeder.build_users

    ## publishers
    Seeder.build_publishers

    require "sqlite3"
    require "faker"

    database = SQLite3::Database.open "amazon.db"

    fake_author_names = []

    book_titles = []
    genres = ["Horror", "Romance", "Teen", "Sci Fi", "Mystery", "Fiction", "Non-fiction"] # 7 genres
    book_release_dates = []

    review_ratings = [1,2,3,4,5]
    review_content = []


    50.times do ## authors
      fake_author_names << Faker::Name.name
    end

    200.times do ## books
      book_titles << Faker::Lorem.word
      book_release_dates << Faker::Business.credit_card_expiry_date.to_s
    end

    50.times do ## reviews
      review_content << Faker::Lorem.sentence
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
  end
end
