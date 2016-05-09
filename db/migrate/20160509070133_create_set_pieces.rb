class CreateSetPieces < ActiveRecord::Migration
  def change
    create_table :set_pieces do |t|
      t.integer :gear_id
      t.string :wow_id
      t.timestamps null: false
    end
  end
end
