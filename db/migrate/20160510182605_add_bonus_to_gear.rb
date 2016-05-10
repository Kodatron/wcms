class AddBonusToGear < ActiveRecord::Migration
  def change
    add_column :gears, :bonus, :string, default: nil, after: :content
  end
end
