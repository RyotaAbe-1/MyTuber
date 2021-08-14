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
  has_many :follows
  has_many :comments
end
