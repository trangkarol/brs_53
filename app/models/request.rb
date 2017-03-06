class Request < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :category_id, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.maximum_name_email}

  delegate :name, to: :category, prefix: true
  delegate :name, to: :user, prefix: true

  scope :list_newest_desc, -> {order "created_at desc"}

  enum status: {pending: 0, accept: 1, reject: 2}
end
