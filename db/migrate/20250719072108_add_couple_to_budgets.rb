class AddCoupleToBudgets < ActiveRecord::Migration[8.0]
  def change
    add_reference :budgets, :couple, foreign_key: true
  end
end
