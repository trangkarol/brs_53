class Category < ApplicationRecord
  has_many :books

  validates :name, presence: true,
    length: {maximum: Settings.maximum_name_email}, uniqueness: true
  scope :list_newest_desc, -> {order "created_at desc"}
end
