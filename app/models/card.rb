class Card < ApplicationRecord
  belongs_to :couple
  belongs_to :event
end
