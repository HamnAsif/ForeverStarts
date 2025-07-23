class RemoveServiceIdFromBudgets < ActiveRecord::Migration[8.0]
  def change
    remove_reference :budgets, :service, null: false, foreign_key: true
  end
end
