class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :wow_region, limit: 1, default: 0
      t.string  :wow_server
      t.integer :wow_class, limit: 1, default: 0
      t.string  :firstname
      t.string  :lastname
      t.string  :phone
      t.string  :avatar
      t.timestamps null: false
    end
  end
end
