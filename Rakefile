require 'rake'

namespace 'db' do
  desc 'Load schema from sql'
  task :load do
    `sqlite3 amazon.db < schema.sql`
  end
end
