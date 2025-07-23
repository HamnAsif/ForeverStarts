class FixDefaultTodolistStatus < ActiveRecord::Migration[8.0]
  def change
     change_column_default :todo_lists, :todolist_status, 0
  end
end
