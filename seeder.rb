require './models/model'
require './models/user'

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
end
