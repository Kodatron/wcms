class CreateEnchants < ActiveRecord::Migration
  def change
    create_table :enchants do |t|
      t.integer :gear_id
      t.integer :wow_id
      t.timestamps null: false
    end
  end
end
