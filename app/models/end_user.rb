class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :shops
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # is_deletedがfalseならtrueを返すように
  def active_for_authentication?
    super && (is_deleted == false)
  end


end
