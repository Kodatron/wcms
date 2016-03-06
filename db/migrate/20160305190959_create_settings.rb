class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.integer :locale, limit: 1, default: 0
      t.timestamps null: false
    end
  end
end
