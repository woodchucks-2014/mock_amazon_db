class Book < Model
  self.attributes = [:id, :author_id, :publisher_id, :title, :genre, :released_on, :created_at, :updated_at]
end
