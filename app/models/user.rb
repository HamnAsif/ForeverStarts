class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to :authenticatable, polymorphic: true, optional: true

  has_one_attached :profile_image

end
