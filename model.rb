require 'sqlite3'

class Model
  def self.establish_connection
    @@database ||= SQLite3::Database.open DB_FILE, results_as_hash: true
  end

  def self.database
    @@database
  end

  def self.table_name
    self.to_s.downcase + 's'
  end

  def self.attributes=(attributes)
    @attributes = attributes

    attributes.each do |attribute|
      define_method(attribute.to_sym) do
        @attrs[attribute.to_s]
      end

      define_method( (attribute.to_s + '=').to_sym ) do |value|
        @attrs[attribute.to_s] = value
      end
    end
  end

  def self.attributes
    @attributes
  end

  def self.all
    records = database.execute("SELECT * FROM #{table_name};")
    records.map { |record| self.new( record ) }
  end

  def self.count
    database.execute("SELECT COUNT(*) FROM #{table_name};")[0][0]
  end

  def initialize(attrs = {})
    @attrs = attrs
  end

  def save
    sql = %Q(
      INSERT INTO #{self.class.table_name} (#{self.class.attributes.join(',')})
      VALUES (#{self.class.attributes.map { '?' }.join(',')})
    )
    database.execute(sql, self.class.attributes.map { |attr| self.send(attr) })
  end

private

  def database
    self.class.database
  end
end
