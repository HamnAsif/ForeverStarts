class Rating < ApplicationRecord
  belongs_to :couple
  belongs_to :service

  validates :stars, presence: true, inclusion: { in: 1..5 }
  validates :feedback, presence: true

  # Optional safeguard (1 rating per couple per service)
  validates :service_id, uniqueness: { scope: :couple_id }

end
