class Couple < ApplicationRecord
  has_one :user, as: :authenticatable, dependent: :destroy
end
