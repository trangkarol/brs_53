class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :comments

  validates :content, presence: true

  scope :list_newest_desc, -> {order created_at: :desc}

  delegate :name, to: :user, prefix: true
end
