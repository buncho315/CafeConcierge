class Genre < ApplicationRecord
  has_many :shops, through: :shop_genres
end
