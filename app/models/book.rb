class Book < ApplicationRecord
  belongs_to :category

  has_many :marks
  has_many :reviews, dependent: :destroy
  has_many :like_activities

  mount_uploader :picture, PictureUploader

  validates :author, presence: true
  validates :picture, presence: true
  validates :introduction, presence: true,
    length: {maximum: Settings.maximum_introduction}
  validates :title, presence: true,
    length: {maximum: Settings.maximum_name_email}
  validates :publish_date, presence: true

  delegate :name, to: :category, prefix: true

  scope :list_newest_desc, -> {order "created_at desc"}
  scope :search_title, -> search {where "title like ?", "%#{search}%"}
  scope :search_author, -> search {where "author like ?", "%#{search}%"}
  scope :search_rating, -> search {where "avg_rate like ?", "%#{search}%"}
  scope :search_all, -> search {where "title like ? or author like ?
    or avg_rate like ?", "%#{search}%", "%#{search}%", "%#{search}%"}
end
