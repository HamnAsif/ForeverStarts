class AddServiceToAppointments < ActiveRecord::Migration[8.0]
  def change
    add_reference :appointments, :service, null: true, foreign_key: true

  end
end
