class CreateVendors < ActiveRecord::Migration[8.0]
  def change
    create_table :vendors do |t|
      t.string :username
      t.string :category

      t.timestamps
    end
  end
end
