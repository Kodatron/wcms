class CreateAlts < ActiveRecord::Migration
  def change
    create_table :alts do |t|

      t.timestamps null: false
    end
  end
end
