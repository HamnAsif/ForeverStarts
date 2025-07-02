class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to :authenticatable, polymorphic: true, optional: true
  def couple?
  authenticatable_type == "Couple"
  end

  def vendor?
    authenticatable_type == "Vendor"
  end
end
