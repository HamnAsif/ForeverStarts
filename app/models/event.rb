class Event < ApplicationRecord
  belongs_to :couple
  validates :event_name, presence: true
  validates :event_date, presence: true
  has_many :guests, dependent: :destroy
end
