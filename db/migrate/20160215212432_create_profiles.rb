class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true
      t.integer :region, limit: 1, default: 0
      t.string  :server
      t.integer :class, limit: 1, default: 0
      t.string  :firstname
      t.string  :lastname
      t.string  :phone
      t.string  :avatar
      t.timestamps null: false
    end
  end
end
