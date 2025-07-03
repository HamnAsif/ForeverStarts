class Couple < ApplicationRecord
  has_one :user, as: :authenticatable, dependent: :destroy
  has_many :events, dependent: :destroy
end
