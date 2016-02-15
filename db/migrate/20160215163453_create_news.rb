class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.integer :permissions, limit: 1, default: 0
      t.integer :views
      t.integer :status, limit: 1, default: 0
      t.timestamps null: false
    end
  end
end
