class AdminContact < ApplicationRecord
  validates :message, presence: true, length: { maximum: 1000 }
  
  belongs_to :contact
end
