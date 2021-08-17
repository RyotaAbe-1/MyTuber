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
  has_many :follow_relationships, foreign_key: "follow_id", class_name: "Relationship", dependent: :destroy
  has_many :follows, through: :follow_relationships
  has_many :follower_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
end
