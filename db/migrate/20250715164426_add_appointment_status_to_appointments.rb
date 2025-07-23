class AddAppointmentStatusToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_column :appointments, :appointment_status, :integer, default: 0
  end
end
