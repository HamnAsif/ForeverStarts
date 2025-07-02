class AddAuthenticatableToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :authenticatable, polymorphic: true, null: false
  end
end
