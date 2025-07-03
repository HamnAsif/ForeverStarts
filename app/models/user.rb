class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  belongs_to :authenticatable, polymorphic: true, optional: true

end
