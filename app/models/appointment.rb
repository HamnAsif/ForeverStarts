class Appointment < ApplicationRecord
  belongs_to :couple
  belongs_to :service


  enum :appointment_status, { pending: 0, confirmed: 1, completed: 2, cancelled: 3 }

end
