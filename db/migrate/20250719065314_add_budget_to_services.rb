class AddBudgetToServices < ActiveRecord::Migration[8.0]
  def change
    add_reference :services, :budget, null: true, foreign_key: true
  end
end
