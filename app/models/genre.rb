class Genre < ApplicationRecord
  has_many :user_genres
  has_many :youtuber_genres
end
