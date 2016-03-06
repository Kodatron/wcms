class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :locale
      t.integer :wow_region, limit: 1, default: 0
      t.timestamps null: false
    end
  end
end
