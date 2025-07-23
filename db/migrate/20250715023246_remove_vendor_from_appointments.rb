class RemoveVendorFromAppointments < ActiveRecord::Migration[8.0]
  def change
    remove_reference :appointments, :vendor, null: false, foreign_key: true
  end
end
