class AddColumnsToVendor < ActiveRecord::Migration[8.0]
  def change
    add_column :vendors, :contact, :string
    add_column :vendors, :location, :string
    add_column :vendors, :description, :text
  end
end
