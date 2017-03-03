class Book < ApplicationRecord
  belongs_to :category

  has_many :marks
  has_many :reviews, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :author, presence: true
  validates :picture, presence: true
  validates :introduction, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.maximum_name_email}
  validates :publish_date, presence: true

  delegate :name, to: :category, prefix: true

  scope :list_newest_desc, -> {order "created_at desc"}
end
