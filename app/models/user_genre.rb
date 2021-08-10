class UserGenre < ApplicationRecord
  belongs_to :user_genres
  belongs_to :genre
end
