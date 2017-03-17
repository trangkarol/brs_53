class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :list_newest_desc, -> {order created_at: :desc}
  scope :search_title, -> search {where "title like ?", "%#{search}%"}
  scope :check_user_book, -> user, book {where "user_id = ? and book_id = ?",
    user, book}
end
