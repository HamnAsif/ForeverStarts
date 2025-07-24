class Vendor < ApplicationRecord
  has_one :user, as: :authenticatable, dependent: :destroy

    SERVICE_TYPES = [
    'Photographers',
    'Caterers',
    'Decorators',
    'DJs',
    'Event Planners',
    'Cake Designers',
    'Makeup Artists',
    'Henna Artists',
    'Bridal Wear Designers',
    'Groom Wear',
    'Jewelry Designers',
    'Live bands/singers',
    'Dhol/Traditional Performers',
    'Fireworks/Special Effects',
    'Invitation Designers',
    'Wedding Car Rentals',
    'Travel agents/Honeymoon Packages',
    'Guest Transport Services',
    'Nikkah Khawan',
    'Marriage Registrars',
    'Tents and Furniture Rentals',
    'Hair stylists'

  ]
  has_many :notifications, as: :recipient, class_name: "Noticed::Notification", dependent: :destroy
  def self.ransackable_attributes(auth_object = nil)
    %w[username category]
  end
  has_many :services
  has_many :appointments, through: :services


end
