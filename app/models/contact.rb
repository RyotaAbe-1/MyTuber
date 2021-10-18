class Contact < ApplicationRecord
  validates :subject, presence: true, length: { maximum: 25 }
  validates :message, presence: true, length: { maximum: 400 }
  
  belongs_to :user
  has_many :admin_contacts
end
