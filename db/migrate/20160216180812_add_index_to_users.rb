class AddIndexToUsers < ActiveRecord::Migration
  def change
    add_index :users, [:email, :name], :unique => true
  end
end
