class CreateServices < ActiveRecord::Migration[8.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :caption
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
