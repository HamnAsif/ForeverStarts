class CreateCouples < ActiveRecord::Migration[8.0]
  def change
    create_table :couples do |t|
      t.string :bride_name
      t.string :groom_name

      t.timestamps
    end
  end
end
