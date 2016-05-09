class AddSetPieceToGear < ActiveRecord::Migration
  def change
    add_column :gears, :set, :boolean, default: 0, after: :content
  end
end
