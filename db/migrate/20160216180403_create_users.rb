class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string  :firstname
      t.string  :lastname
      t.string  :phone
      t.string  :password_digest
      t.string  :remember_digest
      t.string  :activation_digest
      t.integer :activated, default: false
      t.datetime :activated_at
      t.string   :reset_digest
      t.datetime  :reset_sent_at
      t.timestamps null: false
    end

    add_index :users, [:email], :unique => true
  end
end
