class User < Model
  attr_reader :id, :name, :email, :password, :username

  def initialize(attrs = {})
    @id = attrs.fetch(:id) { nil }
    @name = attrs.fetch(:name) { nil }
    @email = attrs.fetch(:email) { nil }
    @password = attrs.fetch(:password) { nil }
    @username = attrs.fetch(:username) { nil }
  end

  def save
    database.execute("INSERT INTO users (name, email, password, username) VALUES (?, ?, ?, ?)", [name, email, password, username])
  end
end
