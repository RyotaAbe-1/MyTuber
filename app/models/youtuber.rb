class Youtuber < ApplicationRecord
  has_many :favorites,       dependent: :destroy
  has_many :youtuber_genres, dependent: :destroy
  has_many :comments,        dependent: :destroy
  belongs_to :user
end
