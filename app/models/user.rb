class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :favorites
  has_many :youtubers
  has_many :comments
  has_many :follower_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :followed
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followeds, through: :followed_relationships, source: :follower
  
  def follow(user_id)
    follower_relationships.create(followed_id: user_id)
  end
  
  def unfollow(user_id)
    follower_relationships.find_by(followed_id: user_id).destroy
  end
  
  def following?(user)
    followers.include?(user)
  end
  
  def followed?(user)
    followeds.include?(user)
  end
  
  def number_of_followers
    follower_relationships.length
  end
  
  def number_of_followed
    followed_relationships.length
  end
  
  def self.search(keyword)
    where(["user_name like?", "%#{keyword}%"])
  end
  
end
