class Room < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  has_many :posts
end
