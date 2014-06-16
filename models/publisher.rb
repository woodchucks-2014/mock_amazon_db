class Publisher < Model
  attr_reader :id, :name

  def initialize(attrs = {})
    @id = attrs.fetch(:id) { nil }
    @name = attrs.fetch(:name) { nil }
  end

  def save
    database.execute("INSERT INTO publishers (name) VALUES (?)", name)
  end
end
