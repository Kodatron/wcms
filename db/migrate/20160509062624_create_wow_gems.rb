class CreateWowGems < ActiveRecord::Migration
  def change
    create_table :wow_gems do |t|
      t.integer :gear_id
      t.integer :wow_id
      t.timestamps null: false
    end
  end
end
