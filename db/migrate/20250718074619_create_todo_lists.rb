class CreateTodoLists < ActiveRecord::Migration[8.0]
  def change
    create_table :todo_lists do |t|
      t.references :event, null: false, foreign_key: true
      t.string :title
      t.string :todolist_status

      t.timestamps
    end
  end
end
