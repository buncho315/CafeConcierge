class ShopGenre < ApplicationRecord
  belongs_to :shop
  belongs_to :genres
end
