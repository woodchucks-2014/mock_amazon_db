require 'sqlite3'

class Model
  DB_FILE = File.expand_path('../../amazon.db', __FILE__)

  def self.establish_connection
    @database ||= SQLite3::Database.open DB_FILE
  end

  def self.database
    @database
  end

  def database
    Model.database
  end
end
