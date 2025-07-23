class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.references :couple, null: false, foreign_key: true
      t.time :event_time
      t.string :venue
      t.string :rsvp_contact
      t.string :template
      t.string :invitation_line

      t.timestamps
    end
  end
end
