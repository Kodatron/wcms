class CreateAlts < ActiveRecord::Migration
  def change
    create_table :alts do |t|
      t.integer :user_id
      t.string :wow_name
      t.integer :wow_class, limit: 1, default: 0
      t.integer :wow_region, limit: 1, default: 0
      t.integer :wow_server, limit: 1, default: 0
      t.string :wow_spec
      t.string :avatar
      t.timestamps null: false
    end
  end
end
