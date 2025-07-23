class CreateBudgets < ActiveRecord::Migration[8.0]
  def change
    create_table :budgets do |t|
      t.references :service, null: false, foreign_key: true
      t.integer :total_budget
      t.integer :spent
      t.integer :remaining

      t.timestamps
    end
  end
end
