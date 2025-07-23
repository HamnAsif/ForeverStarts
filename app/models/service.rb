class Service < ApplicationRecord
  belongs_to :vendor
  has_many :appointments, dependent: :destroy
  has_many_attached :images, dependent: :purge_later
  has_many :ratings, dependent: :destroy
  belongs_to :budget, optional: true

end
