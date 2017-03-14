class Activity < ApplicationRecord
  belongs_to :user
  has_many :likes

  scope :list_newest_desc, -> {order created_at: :desc}

end
