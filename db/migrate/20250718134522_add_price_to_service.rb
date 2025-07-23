class AddPriceToService < ActiveRecord::Migration[8.0]
  def change
    add_column :services, :price, :integer, default: 0
  end
end
