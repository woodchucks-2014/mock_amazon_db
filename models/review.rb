class Review < Model
  self.attributes = [:id, :book_id, :user_id, :rating, :content, :created_at, :updated_at]
end
