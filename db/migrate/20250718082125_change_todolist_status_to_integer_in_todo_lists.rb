class ChangeTodolistStatusToIntegerInTodoLists < ActiveRecord::Migration[8.0]
  def up
    
    change_column :todo_lists, :todolist_status, :integer, default: 0
  end

  def down
    change_column :todo_lists, :todolist_status, :string
  end
end
