class CreateTrays < ActiveRecord::Migration
  def change
    create_table :trays do |t|
      t.integer :board_id
      t.decimal :width
      t.decimal :depth

      t.timestamps null: false
    end
  end
end
