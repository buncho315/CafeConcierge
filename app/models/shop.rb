class Shop < ApplicationRecord
  belongs_to :end_user
  has_many :comments
  #belongs_to :genre, through: :shop_genres
  has_one_attached :image
end
