class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true

  scope :list_newest_desc, -> {order created_at: :desc}
end
