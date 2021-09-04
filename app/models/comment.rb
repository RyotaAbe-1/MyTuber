class Comment < ApplicationRecord
  validates :content, presence: true, length: { in: 1..100 }

  belongs_to :user
  belongs_to :youtuber
end
