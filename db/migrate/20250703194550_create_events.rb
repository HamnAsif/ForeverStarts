class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.references :couple, null: false, foreign_key: true

      t.timestamps
    end
  end
end
