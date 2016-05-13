class AddLvlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :level, :integer, default: 1, after: :name
  end
end
