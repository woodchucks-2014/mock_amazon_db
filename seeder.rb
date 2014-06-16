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
end
