class Shop < ApplicationRecord
  belongs_to :end_user
  #belongs_to :genre
  has_one_attached :image
end
