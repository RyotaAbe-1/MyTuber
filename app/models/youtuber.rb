class Youtuber < ApplicationRecord
  has_many :favorites,       dependent: :destroy
  has_many :comments,        dependent: :destroy
  belongs_to :user
  belongs_to :genre
  
  def number_of_comments
    comments.count
  end
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def number_of_favorites
    favorites.count
  end
  
end
