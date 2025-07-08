class CreateGuests < ActiveRecord::Migration[8.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :whatsapp
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
