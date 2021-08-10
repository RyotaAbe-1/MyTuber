class YoutuberGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :youtuber
end
