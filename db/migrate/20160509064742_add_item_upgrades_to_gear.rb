class AddItemUpgradesToGear < ActiveRecord::Migration
  def change
    add_column :gears, :item_upgrades, :integer, default: 0, after: :content
  end
end
