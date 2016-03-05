class CreateAltRequests < ActiveRecord::Migration
  def change
    create_table :alt_requests do |t|
      t.integer :user_id
      t.integer :alt_id
      t.string :reason
      t.integer :status, limit: 1, default: 0
      t.timestamps null: false
    end
  end
end
