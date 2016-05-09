class CreateArmoryUpdates < ActiveRecord::Migration
  def change
    create_table :armory_updates do |t|
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
