class CreateGuildApplications < ActiveRecord::Migration
  def change
    create_table :guild_applications do |t|
      t.string :wow_name
      t.string :email
      t.integer :status, limit: 1, default: 0
      t.integer :wow_region, limit: 1, default: 0
      t.string :wow_server
      t.integer :wow_class, limit: 1, default: 0
      t.string :wow_spec
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.text :q_1
      t.text :q_2
      t.text :q_3
      t.text :q_4
      t.text :q_5
      t.text :q_6
      t.text :q_7
      t.text :q_8
      t.string :raid_ui
      t.integer :age
      t.timestamps null: false
    end
  end
end
