class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :status, limit: 1, defaul: 0
      t.string :title
      t.string :body
      t.timestamp :published_at
      t.timestamps null: false
    end
  end
end
