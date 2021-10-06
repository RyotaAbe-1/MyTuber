class Contact < ApplicationRecord
  validates :subject, presence: true, length: { maximum: 25 }
  validates :message, presence: true, length: { maximum: 400 }
end
