class Couple < ApplicationRecord
  has_one :user, as: :authenticatable, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :ratings
  has_many :cards
  has_one :budget
  after_create :create_default_budget
  has_many :notifications, as: :recipient, class_name: "Noticed::Notification", dependent: :destroy

   def self.ransackable_attributes(auth_object = nil)
    %w[id bride_name groom_name created_at updated_at]
  end
  private

  def create_default_budget
    create_budget 
  end
  
end
