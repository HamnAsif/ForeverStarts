class Couple < ApplicationRecord
  has_one :user, as: :authenticatable, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :ratings
  has_many :cards
  has_one :budget
  after_create :create_default_budget

  private

  def create_default_budget
    create_budget 
  end
  
end
