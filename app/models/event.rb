class Event < ApplicationRecord
  belongs_to :couple
  validates :event_name, presence: true
  validates :event_date, presence: true
  has_many :guests, dependent: :destroy
  has_many :cards
  has_many :todo_lists, dependent: :destroy
  accepts_nested_attributes_for :todo_lists, allow_destroy: true
  validates :event_name, :event_date, presence: true

  # ✅ Prevent duplicate event name and date per couple
  validates :event_name, uniqueness: { scope: [:event_date, :couple_id], message: "already exists for that date" }

  # ✅ Date must be today or in future
  validate :event_date_cannot_be_in_past

  def event_name_with_date
    "#{event_name} - #{event_date.strftime('%B %d, %Y')}"
  end

  private

  def event_date_cannot_be_in_past
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, "must be today or in the future")
    end
  end


  
end
