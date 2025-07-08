class Guest < ApplicationRecord
  belongs_to :event
  validates :name, presence: true
  validates :whatsapp, presence: true
end
