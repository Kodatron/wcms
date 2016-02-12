class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :status, limit: 1, default: 0
      t.string :title
      t.text :body
      t.integer :views, default: 0
      t.timestamp :published_at
      t.timestamps null: false
    end
  end
end
