require 'rake'

namespace 'db' do
  desc 'Load schema from sql'
  task :load do
    `sqlite3 amazon.db < schema.sql`
  end

  desc 'Seed database with sample data'
  task :seed => :load do
    require './seeder'

    ## people
    Seeder.build_users

    ## publishers
    Seeder.build_publishers

    ## authors
    Seeder.build_authors

    ## books
    Seeder.build_books

    ## reviews
    Seeder.build_reviews

    ## orders
    Seeder.build_orders
  end
end
