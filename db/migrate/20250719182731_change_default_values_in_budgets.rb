class ChangeDefaultValuesInBudgets < ActiveRecord::Migration[8.0]
  def change
    change_column_default :budgets, :total_budget, 0
    change_column_default :budgets, :spent, 0
    change_column_default :budgets, :remaining, 0
  end
end
