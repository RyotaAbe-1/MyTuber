class Genre < ApplicationRecord
  validates :genre_name, presence: true, length: { maximum: 22 }, uniqueness: true

  has_many :user_genres
  has_many :users, through: :user_genres
  has_many :youtubers
end
