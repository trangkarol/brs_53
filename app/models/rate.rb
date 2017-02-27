class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates :rate_point, presence: true
end
