class AddContentDifficultyToGear < ActiveRecord::Migration
  def change
    add_column :gears, :content, :string, after: :transmogged
  end
end
