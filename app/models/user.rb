class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :authenticatable, polymorphic: true, optional: true

  has_one_attached :profile_image

  validates :password, presence: true, confirmation: true, if: :password_required?

  private

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
