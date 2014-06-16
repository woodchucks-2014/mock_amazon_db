class Order < Model
  self.attributes = [:id,:book_id,:user_id,:author_id,:publisher_id,:created_at,:updated_at]
end
