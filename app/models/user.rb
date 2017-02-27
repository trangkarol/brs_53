class User < ApplicationRecord

  has_many :rates
  has_many :like_activities
  has_many :marks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy 
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy                                   
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy                                  
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true,
    length: {maximum: Settings.maximum_name_email}
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},
    length: {maximum: Settings.maximum_name_email}, uniqueness: true    
  validates :password, presence: true, length: {minimum: Settings.minimum_password}

end
