class Request < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates :category_id, presence: true
  validates :title_book, presence: true,
    length: {maximum: Settings.maximum_name_email}
end
