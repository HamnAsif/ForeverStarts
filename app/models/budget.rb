class Budget < ApplicationRecord
   has_many :services, dependent: :destroy 
   belongs_to :couple
   # app/models/budget.rb
validates :total_budget, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
