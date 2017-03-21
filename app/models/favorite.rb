class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :list_newest_desc, -> {order created_at: :desc}

  scope :check_favorite_for_user, -> user_id, book_id do
    where "user_id = ? and book_id = ?", user_id, book_id
  end
end
