class Book < ApplicationRecord
  belongs_to :category

  has_many :marks
  has_many :reviews, dependent: :destroy

  validates :author, presence: true
  validates :picture, presence: true
  validates :introduction, presence: true
  validates :title, presence: true,
    length: {maximum: Settings.maximum_name_email}, uniqueness: true
  VALID_DATE_REGEX = /\A\d{4}\-(?:0?[1-9]|1[0-2])\-(?:0?[1-9]|[1-2]\d|3[01])\z/i
  validates :publish_date, presence: true, format: {with: VALID_DATE_REGEX}

end
