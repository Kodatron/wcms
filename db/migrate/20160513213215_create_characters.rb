class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.string  :name
      t.integer :level, default: 1
      t.integer :wow_region, limit: 1, default: 0
      t.string  :wow_server
      t.integer :wow_class, limit: 1, default: 0
      t.integer :wow_spec, limit: 1, default: 0
      t.string  :avatar_url
      t.string  :profile_url
      t.integer :state
      t.timestamps null: false
    end
  end
end
