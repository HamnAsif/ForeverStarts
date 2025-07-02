class Vendor < ApplicationRecord
  has_one :user, as: :authenticatable, dependent: :destroy
    SERVICE_TYPES = [
    'Photography',
    'Catering',
    'Venue Decoration',
    'DJ',
    'Event Planning'
  ]
end
