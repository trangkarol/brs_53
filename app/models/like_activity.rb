class LikeActivity < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :book, foreign_key: "book_id"
end
