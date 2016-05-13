class CreateGears < ActiveRecord::Migration
  def change
    create_table :gears do |t|
      t.integer     :user_id
      t.integer     :item_id
      t.string      :name
      t.string      :thumbnail
      t.string      :bonus, default: nil
      t.string      :content
      t.integer     :quality, limit: 1, default: 0
      t.integer     :ilvl
      t.integer     :item, limit: 1, default: 0
      t.integer     :item_upgrades, default: 0
      t.boolean     :active, default: 0
      t.timestamps  null: false
    end
  end
end
