require './environment'

module Seeder
  require 'faker'

  def self.build_users
    100.times do
      user = User.new( name: Faker::Name.name,
                       email: Faker::Internet.email,
                       password: Faker::Internet.password,
                       username: Faker::Internet.user_name )
      user.save
    end
  end

  def self.build_publishers
    20.times do
      publisher = Publisher.new(name: Faker::Company.name)
      publisher.save
    end
  end

  def self.build_authors
    50.times do
      author = Author.new(name: Faker::Name.name)
      author.publisher_id = Publisher.all.sample.id
      author.save
    end
  end

  def self.build_books
    genres = ["Horror", "Romance", "Teen", "Sci Fi", "Mystery", "Fiction", "Non-fiction"] # 7 genres
    200.times do
      book = Book.new(title: Faker::Lorem.word,
                      released_on: Faker::Business.credit_card_expiry_date.to_s)
      book.author_id = Author.all.sample.id
      book.publisher_id = Publisher.all.sample.id
      book.genre = genres.sample
      book.save
    end
  end

  def self.build_reviews
    review_ratings = [1,2,3,4,5]
    50.times do
      review = Review.new(content: Faker::Lorem.sentence)
      review.user_id = User.all.sample.id
      review.book_id = Book.all.sample.id
      review.rating = review_ratings.sample
      review.save
    end
  end

  def self.build_orders
    100.times do
      order = Order.new
      order.user_id = User.all.sample.id
      order.book_id = Book.all.sample.id
      order.author_id = Author.all.sample.id
      order.publisher_id = Publisher.all.sample.id
      order.save
    end
  end
end
