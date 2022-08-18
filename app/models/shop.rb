class Shop < ApplicationRecord
  belongs_to :end_user
  has_many :comments
  #belongs_to :genre, through: :shop_genres
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  def self.looks(search, word)
    if search == "完全一致"
      @shop = Shop.where("title LIKE?", "#{word}")
    elsif search == "前方一致"
      @shop = Shop.where("title LIKE?","#{word}%")
    elsif search == "後方一致"
      @shop = Shop.where("title LIKE?","%#{word}")
    elsif search == "部分一致"
      @shop = Shop.where("title LIKE?","%#{word}%")
    else
      @shop = Shop.all
    end
  end

  def self.looks_access(search, word)
    if search == "完全一致"
      @shop = Shop.where("access LIKE?", "#{word}")
    elsif search == "前方一致"
      @shop = Shop.where("access LIKE?","#{word}%")
    elsif search == "後方一致"
      @shop = Shop.where("access LIKE?","%#{word}")
    elsif search == "部分一致"
      @shop = Shop.where("access LIKE?","%#{word}%")
    else
      @shop = Shop.all
    end
  end

  def favorited_by?(end_user)
    favorites.exists?(end_user_id: end_user.id)
  end

end
