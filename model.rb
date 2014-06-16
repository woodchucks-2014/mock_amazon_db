require 'sqlite3'

class Model
  def self.establish_connection
    @@database ||= SQLite3::Database.open DB_FILE
  end

  def self.database
    @@database
  end

  def self.table_name
    self.to_s.downcase + 's'
  end

  def database
    Model.database
  end

  def self.count
    database.execute("SELECT COUNT(*) FROM #{table_name};").first.first
  end
end
